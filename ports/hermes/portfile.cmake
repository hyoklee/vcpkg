vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO  HDFGroup/hermes
    REF "${VERSION}"
    SHA512 39fd0cff7d866f0d232d6aa889fa1548a9c21a89c04bc198ac0c2010c9ef582efb45f584ce4f21f56637e2f5a357c0f2b3590657ce2ac7e3875fcaf2f0b2bd7f
    HEAD_REF master
    PATCHES
        hrun.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS -DBUILD_OpenMP_TESTS:BOOL=OFF
    # PTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_cmake_install()

