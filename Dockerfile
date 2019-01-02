FROM ubuntu:18.04

# install required ubuntu packages
RUN apt-get update --fix-missing
RUN apt-get install -y libxrender1 libxext6 wget git build-essential cmake libeigen3-dev libboost-all-dev

# install miniconda
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

# add conda bin to path
ENV PATH /opt/conda/bin:$PATH

# use the environment.yml to create the conda env
COPY config/environment.yml /tmp/environment.yml

# create the conda env
RUN conda env create -n cling -f /tmp/environment.yml

# activate env (add conda env bin to path)
ENV PATH /opt/conda/envs/cling/bin:$PATH

# get RDKit
RUN git clone https://github.com/rdkit/rdkit.git

# create rdkit/build directory
RUN mkdir rdkit/build
WORKDIR /rdkit/build
RUN git checkout tags/Release_2018_09_1

# cmake
RUN cmake -DRDK_BUILD_INCHI_SUPPORT=ON ..

# make and make install
RUN make && make install

# start jupyter notebook server
CMD ["/config/fireitup.sh"]