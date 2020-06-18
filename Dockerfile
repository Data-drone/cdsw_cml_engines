FROM docker.repository.cloudera.com/cdsw/engine:11

RUN apt-get -y update && \
    apt-get -y upgrade

RUN npm cache clean -f
RUN npm install -g n
RUN n stable

RUN pip3 install jupyterlab==2.1.4

