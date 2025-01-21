if(VCPKG_TARGET_IS_OSX)
    vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO  grc-iit/hermes-shm
        REF "v${VERSION}"
        SHA512 83b9253b2172587ac60a75f1501417d42bc0fe7045291a66aad1bb196eb7ff26d67cdd8fafce8fbeb412decd52d82a9df7fefed227a5eb8bcf212c058520bf60
        HEAD_REF master
        PATCHES
            random.patch
            sysinfo.patch
    )
else()
    vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO  grc-iit/hermes-shm
        REF "v${VERSION}"
        SHA512 83b9253b2172587ac60a75f1501417d42bc0fe7045291a66aad1bb196eb7ff26d67cdd8fafce8fbeb412decd52d82a9df7fefed227a5eb8bcf212c058520bf60
        HEAD_REF master
        PATCHES
            random.patch
    )
endif()


vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        thallium HERMES_RPC_THALLIUM
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHERMES_ENABLE_DOXYGEN=OFF
        -DHERMES_RPC_THALLIUM=OFF	
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
