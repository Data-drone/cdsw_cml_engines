#FROM docker.repository.cloudera.com/cdsw/engine:13
FROM docker.repository.cloudera.com/cloudera/cdsw/engine:13-cml-2020.10-2

WORKDIR /tmp

# remove the cloudera deb
RUN rm -rf /etc/apt/sources.list.d/cloudera.list

### From jupyter stack base: https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
ARG conda_version="4.9.2"
# Miniforge installer patch version
ARG miniforge_patch_number="7"
# Miniforge installer architecture
ARG miniforge_arch="x86_64"
# Package Manager and Python implementation to use (https://github.com/conda-forge/miniforge)
# - conda only: either Miniforge3 to use Python or Miniforge-pypy3 to use PyPy
# - conda + mamba: either Mambaforge to use Python or Mambaforge-pypy3 to use PyPy
ARG miniforge_python="Miniforge-pypy3"

# Miniforge archive to install
ARG miniforge_version="${conda_version}-${miniforge_patch_number}"
# Miniforge installer
ARG miniforge_installer="${miniforge_python}-${miniforge_version}-Linux-${miniforge_arch}.sh"
# Miniforge checksum
ARG miniforge_checksum="a1e75394a9dae16b8981030ab78823669f664bf3e629826060844e1ce8dfc501"

# Fix yarn package keyring
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update \
 && apt-get install -yq --no-install-recommends \
    wget \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    run-one \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

 # Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash 
    #\
    #NB_USER=$NB_USER \
    #NB_UID=$NB_UID \
    #NB_GID=$NB_GID \
    #LC_ALL=en_US.UTF-8 \
    #LANG=en_US.UTF-8 \
    #LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    #PYTHON_VERSION=3.6.10 \
    #HOME=/home/$NB_USER \
    CONDA_VERSION="${conda_version}" \
    MINIFORGE_VERSION="${miniforge_version}"


# Install conda as jovyan and check the sha256 sum provided on the download site
WORKDIR /tmp

# Prerequisites installation: conda, mamba, pip, tini
RUN wget --quiet "https://github.com/conda-forge/miniforge/releases/download/${miniforge_version}/${miniforge_installer}" && \
    echo "${miniforge_checksum} *${miniforge_installer}" | sha256sum --check && \
    /bin/bash "${miniforge_installer}" -f -b && \
    #-f -b -p $CONDA_DIR && \
    rm "${miniforge_installer}" && \
    # Conda configuration see https://conda.io/projects/conda/en/latest/configuration.html
    # pin so it doesn't update conda by accident
    echo "conda ${CONDA_VERSION}" >> $CONDA_DIR/conda-meta/pinned && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true 
    # && \
    # check install a python then pin it
    #if [ ! $PYTHON_VERSION = 'default' ]; then conda install --yes python=$PYTHON_VERSION; fi && \
    #conda list python | grep '^python ' | tr -s ' ' | cut -d '.' -f 1,2 | sed 's/$/.*/' >> $CONDA_DIR/conda-meta/pinned 
    # && \
    # install our specific conda version / pip and tini
    #conda install --quiet --yes \
    #"conda=${CONDA_VERSION}" \
    #'pip' \
    #'tini=0.18.0' && \
    #conda update --all --quiet --yes && \
    #conda list tini | grep tini | tr -s ' ' | cut -d ' ' -f 1,2 >> $CONDA_DIR/conda-meta/pinned 
    # && \
    #conda clean --all -f -y && \
    #rm -rf /home/$NB_USER/.cache/yarn 
    # for jupyter stack notebook user we don't need
    # && \
    #fix-permissions $CONDA_DIR && \
    #fix-permissions /home/$NB_USER