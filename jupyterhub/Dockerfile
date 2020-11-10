FROM docker.repository.cloudera.com/cdsw/engine:11

RUN apt-get -y update && \
    apt-get -y upgrade

RUN npm cache clean -f
RUN npm install -g n
RUN n 10.0.0

WORKDIR /usr/local/lib/node_modules/python3-engine

RUN npm rebuild

RUN pip3 install jupyterlab==2.1.4

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2.0

