# This file contains the options needed to both run the pull request testing
# for Trilinos for the Linux GCC 7.2.0 pull request testing builds, and to reproduce
# the errors reported by those builds. Prior to using this this file, the
# appropriate set of SEMS modules must be loaded and accessible through the
# SEMS NFS mount. (See the sems/PullRequestGCC*TestingEnv.sh files.)

# Usage: cmake -C PullRequestLinuxGCC7.2.0TestingSettings.cmake

# Misc options typically added by CI testing mode in TriBITS

# Use the below option only when submitting to the dashboard
#set (CTEST_USE_LAUNCHERS ON CACHE BOOL "Set by default for PR testing")

set (MPI_EXEC_PRE_NUMPROCS_FLAGS "--bind-to;none" CACHE STRING "Set by default for PR testing")
# NOTE: The above is a workaround for the problem of having threads on MPI
# ranks bind to the same cores (see #2422).

set (Trilinos_ENABLE_COMPLEX_DOUBLE ON CACHE BOOL "Set by default for PR testing to exercise complex doubles case")

# Disable just one Teko sub-unit test that fails with openmpi 1.10 (#2712)
set (Teko_DISABLE_LSCSTABALIZED_TPETRA_ALPAH_INV_D ON CACHE BOOL "Temporarily disabled in PR testing")

include("${CMAKE_CURRENT_LIST_DIR}/PullRequestLinuxCommonTestingSettings.cmake")

# Adding warnings as errors flags to this PR build
#set(CMAKE_CXX_FLAGS "-Wall -Wno-clobbered -Wno-vla -Wno-pragmas -Wno-unknown-pragmas -Wno-unused-local-typedefs -Wno-literal-suffix -Wno-deprecated-declarations -Wno-misleading-indentation -Wno-int-in-bool-context -Wno-maybe-uninitialized -Wno-nonnull-compare -Wno-address -Wno-inline -DTRILINOS_HIDE_DEPRECATED_HEADER_WARNINGS -Werror" CACHE STRING "Warnings as errors settings")

# Set deprecated code flags
set(KOKKOS_ENABLE_DEPRECATED_CODE OFF CACHE BOOL "Set deprecated code flags")
#set(Tpetra_ENABLE_DEPRECATED_CODE OFF CACHE BOOL "Set deprecated code flags") #fails in configuration
set(Belos_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Epetra_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Ifpack2_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Ifpack2_ENABLE_DEPRECATED_CODE OFF CACHE BOOL "Set deprecated code flags")
set(MueLu_ENABLE_DEPRECATED_CODE OFF CACHE BOOL "Set deprecated code flags")
set(Panzer_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Phalanx_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(RTop_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(STK_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Teuchos_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Thyra_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Claps_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(GlobiPack_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(OptiPack_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
set(Trios_HIDE_DEPRECATED_CODE ON CACHE BOOL "Set deprecated code flags")
