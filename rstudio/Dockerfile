FROM docker.repository.cloudera.com/cdsw/engine:13

WORKDIR /tmp

#The RUN commands that install an editor
#For example: RUN apt-get install myeditor

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libapparmor1 \
    libclang-dev \
    lsb-release \
    psmisc \
    sudo && \
  apt-get clean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1093-amd64.deb

RUN wget --quiet https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1093-amd64.deb && \
    dpkg -i rstudio-server-1.3.1093-amd64.deb && \
    rm rstudio-server-1.3.1093-amd64.deb

COPY rserver.conf /etc/rstudio/rserver.conf

COPY rstudio-cdsw /usr/local/bin/rstudio-cdsw

RUN chmod +x /usr/local/bin/rstudio-cdsw