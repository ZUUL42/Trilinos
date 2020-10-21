# This script can be used to load the appropriate environment for the
# Intel 19.0.5 Pull Request testing build on a Linux machine that has access to
# the SEMS NFS mount.

# usage: $ source PullRequestIntel19.0.5TestingEnv.sh

# After the environment is no longer needed, it can be purged using
# $ module purge
# or Trilinos/cmake/unload_sems_dev_env.sh

source /projects/sems/modulefiles/utils/sems-modules-init.sh

export SEMS_FORCE_LOCAL_COMPILER_VERSION=6.1.0
module load sems-git/2.10.1
module load sems-gcc/6.1.0
module load sems-intel/19.0.5
module load sems-openmpi/1.10.1
module load sems-python/2.7.9
module load sems-boost/1.69.0/base
module load sems-zlib/1.2.8/base
module load sems-hdf5/1.8.12/parallel
module load sems-netcdf/4.4.1/exo_parallel
module load sems-parmetis/4.0.3/parallel
module load sems-superlu/4.3/base
module load sems-cmake/3.17.1
module load sems-ninja_fortran/1.10.0
module load trilinos-env
module load trilinos-scotch/6.0.3/nopthread_64bit_parallel

# add the OpenMP environment variable we need
export OMP_NUM_THREADS=2
