vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO iowarp/iowarp-runtime
        REF "dd8c2c2c52d44ed6098f35bc97cb02d0d26195d8"
        SHA512 97da58c4724489dbf4c9112de17f866ec909ac204b38d69737173b67b5e0e570919f44a2218c194130d7b5c555417e2bafb54710d96c24181191de0346537214
        HEAD_REF main
        PATCHES
        cmake.patch	
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    coverage CHIMAERA_ENABLE_COVERAGE
    cuda CHIMAERA_ENABLE_CUDA
    dotenv CHIMAERA_ENABLE_CMAKE_DOTENV
    doxygen CHIMAERA_ENABLE_DOXYGEN
    jemalloc CHIMAERA_ENABLE_JEMALLOC
    mimalloc CHIMAERA_ENABLE_MIMALLOC
    mpi BUILD_MPI_TESTS
    no CHIMAERA_NO_COMPILE
    openmp BUILD_OpenMP_TESTS
    python CHIMAERA_ENABLE_PYTHON
    remote CHIMAERA_REMOTE_DEBUG
    rocm CHIMAERA_ENABLE_ROCM
    shared BUILD_SHARED_LIBS
    task CHIMAERA_TASK_DEBUG    
    test BUILD_TESTS
    zmq BUILD_ZeroMQ_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
