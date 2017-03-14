cmake_minimum_required(VERSION 2.6)
cmake_policy(SET CMP0011 NEW)
project(Jack)
subdirs(src)

include(ExternalProject)

if(${CMAKE_SYSTEM_NAME} MATCHES windows)

    ExternalProject_Add(
        zlib
        PREFIX libs
        URL ${LIBS_DIR_SRC}/zlib-1.2.11.tar.gz
        URL_HASH SHA256=c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1
        PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${PATCHES_DIR}/zlib/Makefile.gcc ${SYSTEM_TMP_LIBS_SRC_DIR}/zlib/win32/Makefile.gcc
        CONFIGURE_COMMAND ""
        BUILD_IN_SOURCE ${SYSTEM_TMP_LIBS_SRC_DIR}/zlib
        BUILD_COMMAND BINARY_PATH=${MINGW_BIN_DIR} INCLUDE_PATH=${MINGW_INCLUDE_DIR} LIBRARY_PATH=${MINGW_LIB_DIR} make -f win32/Makefile.gcc 
        INSTALL_COMMAND DESTDIR=${SYSTEM_LIBS_DIR} BINARY_PATH=/zlib-1.2/bin INCLUDE_PATH=/zlib-1.2/include LIBRARY_PATH=/zlib-1.2/lib make -f win32/Makefile.gcc install SHARED_MODE=1 COMMAND ${CMAKE_COMMAND} -E copy ${ZLIB_BINARY} ${SYSTEM_BIN_LIB_DIR}
    )

    ExternalProject_Add(
        libpng
        PREFIX libs
        DEPENDS zlib 
        URL ${LIBS_DIR_SRC}/libpng-1.6.28.tar.gz
        URL_HASH MD5=897ccec1ebfb0922e83c2bfaa1be8748
        CONFIGURE_COMMAND LDFLAGS=${LIBPNG_LDFLAGS} <SOURCE_DIR>/configure --prefix=${SYSTEM_LIBS_DIR}/libpng-1.6 ${LIBPNG_CONFIGURE_OPTIONS}
        BUILD_COMMAND make CFLAGS=${LIBPNG_CPPFLAGS} LDFLAGS=${LIBPNG_LDFLAGS} 
        INSTALL_COMMAND make install COMMAND ${CMAKE_COMMAND} -E copy ${SDL_BINARY} ${SYSTEM_BIN_LIB_DIR} COMMAND ${CMAKE_COMMAND} -E copy ${LIBPNG_BINARY} ${SYSTEM_BIN_LIB_DIR}
    )

endif(${CMAKE_SYSTEM_NAME} MATCHES windows)

ExternalProject_Add(
    SDL 
    PREFIX libs
    URL ${LIBS_DIR_SRC}/SDL-1.2.15.tar.gz
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${PATCHES_DIR}/SDL/SDL_x11sym.h ${SYSTEM_TMP_LIBS_SRC_DIR}/SDL/src/video/x11/SDL_x11sym.h
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${SYSTEM_LIBS_DIR}/SDL-1.2 ${SDL_CONFIGURE_OPTIONS}
    BUILD_COMMAND make
    INSTALL_COMMAND make install COMMAND ${CMAKE_COMMAND} -E copy ${SDL_BINARY} ${SYSTEM_BIN_LIB_DIR}
)


ExternalProject_Add(
    SDL_image
    PREFIX libs
    URL ${LIBS_DIR_SRC}/SDL_image-1.2.12.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${SYSTEM_LIBS_DIR}/SDL-1.2 ${SDL_IMAGE_CONFIGURE_OPTIONS} 
    BUILD_COMMAND make CFLAGS=${SDL_IMAGE_CFLAGS} LDFLAGS=${SDL_IMAGE_LDFLAGS}
    INSTALL_COMMAND make install COMMAND ${CMAKE_COMMAND} -E copy ${SDL_IMAGE_BINARY} ${SYSTEM_BIN_LIB_DIR}
)

ExternalProject_Add(
    FreeType
    PREFIX libs
    URL ${LIBS_DIR_SRC}/freetype-2.4.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${SYSTEM_LIBS_DIR}/FreeType-2.4 ${FREETYPE_CONFIGURE_OPTIONS}
    BUILD_COMMAND $(MAKE)
    INSTALL_COMMAND $(MAKE) install
)

ExternalProject_Add(
    SDL_ttf
    DEPENDS FreeType
    PREFIX libs
    URL ${LIBS_DIR_SRC}/SDL_ttf-2.0.11.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${SYSTEM_LIBS_DIR}/SDL-1.2 ${SDL_TTF_CONFIGURE_OPTIONS} 
    BUILD_COMMAND make
    INSTALL_COMMAND make install COMMAND ${CMAKE_COMMAND} -E copy ${SDL_TTF_BINARY} ${SYSTEM_BIN_LIB_DIR}
)
