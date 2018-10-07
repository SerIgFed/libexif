find_path(LIBEXIF_ROOT_DIR
    NAMES "include/libexif/exif-data.h"
    PATHS ${LIBEXIF_ROOT_DIR} ENV libexif_ROOT ENV EXIF_ROOT ENV EXIF_ROOT_DIR
    )

find_path(LIBEXIF_INCLUDE_DIR
    NAMES "libexif/exif-data.h"
    HINTS ${LIBEXIF_ROOT_DIR} ${LIBEXIF_ROOT_DIR}/include
    PATH_SUFFIXES "include"
    )

find_library(LIBEXIF_LIBRARY
    NAMES exif libexif libexifd
    HINTS ${LIBEXIF_ROOT_DIR}
    PATH_SUFFIXES "lib"
    )

mark_as_advanced(LIBEXIF_LIBRARY LIBEXIF_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libexif
    REQUIRED_VARS LIBEXIF_LIBRARY LIBEXIF_INCLUDE_DIR
    )

if(libexif_FOUND)
    set(libexif_INCLUDE_DIRS ${LIBEXIF_INCLUDE_DIR})
    set(libexif_LIBRARIES    ${LIBEXIF_LIBRARY})
endif()
