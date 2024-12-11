vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/pmodels/argobots/archive/refs/tags/v1.2.tar.gz"
    FILENAME "v1.2.tar.gz"
    SHA512 4855615ca4a45b9a75c71f61ea19fecf88c0d93d45b1907f46bebd44545ca99c47574d70b3d90cbfb8780cc62ac6ccd2f1d17ef6511b00343a57237024cee5c0
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
    # (Optional) A friendly name to use instead of the filename of the archive (e.g.: a version number or tag).
    # REF 1.0.0
    # (Optional) Read the docs for how to generate patches at:
    # https://github.com/microsoft/vcpkg-docs/blob/main/vcpkg/examples/patching.md
    # PATCHES
    #   001_port_fixes.patch
    #   002_more_port_fixes.patch
)

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    OPTIONS
        ${options}
)

vcpkg_install_make()
vcpkg_fixup_pkgconfig()
