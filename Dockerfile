FROM ubuntu:latest

WORKDIR /app
COPY requirements.txt /app

# install necessary python packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends git-core
RUN apt-get install -y --no-install-recommends build-essential python3.6-dev
RUN apt-get install -y --no-install-recommends python3.6 python-setuptools python3-pip

# install python modules via pip3
RUN pip3 install pip --upgrade
RUN pip3 install setuptools --upgrade
RUN pip3 install --upgrade --trusted-host pypi.python.org -r requirements.txt

# install jupyter-vim-extensions
# the extension must be located in $(jupyter --data-dir)/nbextensions
RUN mkdir -p /root/.local/share/jupyter/nbextensions
WORKDIR /root/.local/share/jupyter/nbextensions
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
# activate jupyter-vim-extensions permanently
# RUN jupyter nbextension enable vim_binding/vim_binding

# switch back to working directory and remove module requirements file
WORKDIR /app
RUN rm requirements.txt

# run jupyter server without browser, allowing root user
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"] 
