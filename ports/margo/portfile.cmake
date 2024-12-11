vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/mochi-hpc/mochi-margo/archive/refs/tags/v0.18.3.tar.gz"
    FILENAME "v0.18.3.tar.gz"
    SHA512 8e3ddae8eb91c239f75b6f69abc53a274b40845aa381d983e6fed205bda9147cea85a4282a566ef440e6e2d74d67b423e1c443471ae93a6f2f01868e74570bf1
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
