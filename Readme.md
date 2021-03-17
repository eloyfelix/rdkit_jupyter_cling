# C++ RDKit Jupyter notebook example

https://chembl.blogspot.com/2019/01/rdkit-c-and-jupyter-notebook.html

- Clone the repo and build the image.

  ```
  docker-compose build
  ```

- Run the container using the image.

  ```
  docker-compose up -d
  ```

- Open jupyter notebook with the browser:

  http://localhost:9999/notebooks/rdkit_cling.ipynb

- To stop and delete the running container:

  ```
  docker-compose down
  ```
