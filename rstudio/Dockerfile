#FROM docker.repository.cloudera.com/cdsw/engine:13
FROM docker.repository.cloudera.com/cloudera/cdsw/engine:13-cml-2020.10-2

WORKDIR /tmp

#The RUN commands that install an editor
#For example: RUN apt-get install myeditor
# remove the cloudera deb
RUN rm -rf /etc/apt/sources.list.d/cloudera.list
# update the gpg key for yarnpkg see
# https://github.com/yarnpkg/yarn/issues/7866
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

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
# latest https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb
RUN wget --quiet https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb && \
#    dpkg -i rstudio-server-1.4.1103-amd64.deb && \
    dpkg -i rstudio-server-1.4.1103-amd64.deb && \
    rm rstudio-server-1.4.1103-amd64.deb

COPY rserver.conf /etc/rstudio/rserver.conf

COPY rstudio-cdsw /usr/local/bin/rstudio-cdsw

RUN chmod +x /usr/local/bin/rstudio-cdsw