# Testing installing conda envs

Conda install in runtimes

```{bash}

# Install steps
# Get the conda file
curl <Miniconda.sh path> --output Miniconda.sh
chmod u+x Miniconda.sh
chmod 777 Miniconda.sh

# install the conda file
./Miniconda.sh

# setup jupyterlab with kernels
conda install -c anaconda ipykernel

# kernel setups
# install kernel 
ipython kernel install --user --name=rapids

## then setup other envs


```
