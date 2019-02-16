# trendyol_data_challenge
A simple project from trendyol. Model for Fashion-MNIST dataset and its outputs in a Jupyter Notebook. Also a Dockerfile to build a Docker image suitable to run a Jupyter Notebook Server for the notebook containing the model.

The Docker image built by the Dockerfile will start a Jupyter Notebook Server in its container when run. The server will start at directory "/app", therefore include "-v your_volume:/app" when running an image of this Dockerfile to access data in the host device.

The notebook contains a model implementation, analysis about model output and training phase, and my approach to improve model performance. Also last cells of the notebook contain a commented out snippet to enable vim bindings for the current notebook session. Simply uncomment and run the cell to enable vim bindings.

For vim bindings, I have used the following git repo: https://github.com/lambdalisue/jupyter-vim-binding
