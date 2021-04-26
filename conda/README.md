# Testing installing conda envs

Conda install in runtimes

```{bash}

# Install steps
# Get the conda install script

# current as of April 2021 - https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
curl <Miniconda.sh path> --output Miniconda.sh
#curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output Miniconda.sh 
chmod u+x Miniconda.sh
chmod 777 Miniconda.sh

# install the conda file
./Miniconda.sh

# setup jupyterlab with kernels
conda install -c anaconda ipykernel nb_conda_kernels

## then setup other envs
conda create -n rapids python=3.7
conda activate rapids

## We seem to need at least a 4-core and 8GB Ram session to successfully run this
conda install -c rapidsai -c nvidia -c conda-forge \
    -c defaults rapids-blazing=0.18 

# kernel setups
# install kernel in (base) ?
# maybe don't need this
#ipython kernel install --user --name=rapids

```
