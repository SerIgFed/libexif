project(libexif)
cmake_minimum_required(VERSION 3.0)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ ${CMAKE_CXX_FLAGS}")
endif()

if(CMAKE_COMPILER_IS_GNUCXX)
  set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "lib")

file(GLOB libexif_HEADERS "libexif/*.h"
    "libexif/canon/*.h"
    "libexif/fuji/*.h"
    "libexif/olympus/*.h"
    "libexif/pentax/*.h")

file(GLOB libexif_SRC "libexif/*.c"
    "libexif/canon/*.c"
    "libexif/fuji/*.c"
    "libexif/olympus/*.c"
    "libexif/pentax/*.c")

include_directories("libexif")
include_directories(".")

add_library(libexif STATIC ${libexif_SRC} ${libexif_HEADERS})
set_target_properties(libexif PROPERTIES OUTPUT_NAME exif)
if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
    set_target_properties(libexif PROPERTIES DEBUG_POSTFIX "d")
endif()

file(GLOB libexif_INC "libexif/*.h")
install(TARGETS libexif
    RUNTIME DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    LIBRARY DESTINATION ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    ARCHIVE DESTINATION ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
install(FILES ${libexif_INC} DESTINATION include/libexif/)
install(FILES "cmake/libexifConfig.cmake" DESTINATION cmake/)
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/libexif.pc.cmake" DESTINATION lib/pkgconfig/)
