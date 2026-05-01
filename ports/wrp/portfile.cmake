vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO hyoklee/wrp
    REF "a109fc1424930f4f523286ab2e29c6a5ed7ee9b3"
    SHA512 10408eaecbbd38476f822cdb66517708853bdfc58ee3542184da62738825dc018aa899f3d7ee982e51343e40cd0cdb30912814a54b94ce8ff887aac2a1fb7abe
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    poco POCO
    aws AWS    
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")