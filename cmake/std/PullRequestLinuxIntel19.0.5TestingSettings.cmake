# This file contains the options needed to both run the pull request testing
# for Trilinos for the Linux Intel 19 pull request testing builds, and to reproduce
# the errors reported by those builds. Prior to using this this file, the
# appropriate set of SEMS modules must be loaded and accessible through the
# SEMS NFS mount. (See the sems/PullRequestGCC*TestingEnv.sh files.)

# Usage: cmake -C PullRequestLinuxIntel19.0.5TestingSettings.cmake

set (CMAKE_CXX_STANDARD "14" CACHE STRING "Set C++ standard to C++14")

# Misc options typically added by CI testing mode in TriBITS

# Use the below option only when submitting to the dashboard
#set (CTEST_USE_LAUNCHERS ON CACHE BOOL "Set by default for PR testing")

set (MueLu_UnitTestsEpetra_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (MueLu_UnitTestsEpetra_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (MueLu_UnitTestsTpetra_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")

# (Temporarily) Disable randomly failing ROL test (#3103)
set (ROL_example_poisson-inversion_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")

include("${CMAKE_CURRENT_LIST_DIR}/PullRequestLinuxCommonTestingSettings.cmake")

set (TPL_Netcdf_LIBRARIES "-L${Netcdf_LIBRARY_DIRS}/lib;${Netcdf_LIBRARY_DIRS}/libnetcdf.so;${Netcdf_LIBRARY_DIRS}/libpnetcdf.a" CACHE STRING "Set by default for CUDA PR testing")

set (CMAKE_CXX_FLAGS -fPIC CACHE STRING "enable relocatable code")
