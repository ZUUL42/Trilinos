# This script can be used to load the appropriate environment for the
# PR build on ride using CUDA.

# usage: $ source PullRequestCUDA9.2TestingEnv.sh

module load git/2.10.1
module load cuda/10.1.243
module load gcc/7.2.0
module load openblas/0.3.1/gcc/7.2.0
module load netlib/3.8.0/gcc/7.2.0 
#export OMPI_CXX=`which g++`
export OMPI_CXX=$WORKSPACE/Trilinos/packages/kokkos/bin/nvcc_wrapper
export OMPI_CC=`which gcc`
export OMPI_FC=`which gfortran`
export CUDA_LAUNCH_BLOCKING=1
export CUDA_MANAGED_FORCE_DEVICE_ALLOC=1

# Use manually installed cmake and ninja to try to avoid module loading
# problems (see TRIL-208)
export PATH=/ascldap/users/rabartl/install/white-ride/cmake-3.11.2/bin:/ascldap/users/rabartl/install/white-ride/ninja-1.8.2/bin:$PATH
