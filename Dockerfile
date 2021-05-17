FROM mambaorg/micromamba:0.11.3

# use the environment.yml to create the conda env
COPY environment.yml /root/environment.yml

RUN micromamba install -y -n base -f /root/environment.yml && \
    micromamba clean --all --yes

# use the notebook
COPY notebooks/rdkit_cling.ipynb /notebooks/rdkit_cling.ipynb

# start jupyter notebook server
CMD jupyter notebook --ip=0.0.0.0 --port=9999 --NotebookApp.token='' --NotebookApp.password='' --allow-root --notebook-dir='/notebooks'
