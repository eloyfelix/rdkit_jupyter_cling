FROM continuumio/miniconda3

# use the environment.yml to create the conda env
COPY config/environment.yml /tmp/environment.yml

# create the conda env using saved environment file
RUN conda env create -n cling -f /tmp/environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "cling", "/bin/bash", "-c"]

# use the notebook
COPY notebooks/rdkit_cling.ipynb /notebooks/rdkit_cling.ipynb

# start jupyter notebook server
CMD jupyter notebook --ip=0.0.0.0 --port=9999 --NotebookApp.token='' --NotebookApp.password='' --allow-root --notebook-dir='/notebooks'
