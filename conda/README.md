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
conda install -c anaconda ipykernel

# setup back kernel
# run this line in each env that you need it in
ipython kernel install --user --name=base

## then setup other envs
conda create -n rapids python=3.7
conda activate rapids

## has to be run from a terminal in Jupyterlab and not in the standard terminal
## gets killed
conda install -c rapidsai -c nvidia -c conda-forge \
    -c defaults rapids-blazing=0.18 

# kernel setups
# install kernel in (base) ?
ipython kernel install --user --name=rapids


```