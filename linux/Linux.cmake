cmake_minimum_required(VERSION 2.6)

set(SYSTEM linux)
set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(BIN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/bin)
set(TMP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tmp)
set(LIBS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs)
set(LIBS_DIR_SRC ${LIBS_DIR}/src)
set(PATCHES_DIR ${LIBS_DIR}/patches)

set(SYSTEM_DIR ${ROOT_DIR}/${SYSTEM})
set(SYSTEM_TMP_DIR ${TMP_DIR}/${SYSTEM})
set(SYSTEM_TMP_LIBS_SRC_DIR ${SYSTEM_TMP_DIR}/libs/src)
set(SYSTEM_LIBS_DIR ${LIBS_DIR}/${SYSTEM})
set(SYSTEM_BIN_DIR ${BIN_DIR}/${SYSTEM})
set(SYSTEM_BIN_LIB_DIR ${BIN_DIR}/${SYSTEM}/lib)

set(SDL_CONFIGURE_OPTIONS --enable-video-x11 --enable-x11-shared --enable-video-x11-vm)

set(SDL_IMAGE_CONFIGURE_OPTIONS --with-sdl-prefix=${SYSTEM_LIBS_DIR}/SDL-1.2)
set(SDL_IMAGE_CFLAGS -I${SYSTEM_LIBS_DIR}/SDL-1.2/include/SDL)

set(FREETYPE_CONFIGURE_OPTIONS "")

set(SDL_TTF_CONFIGURE_OPTIONS --with-freetype-prefix=${SYSTEM_LIBS_DIR}/FreeType-2.4 --with-sdl-prefix=${SYSTEM_LIBS_DIR}/SDL-1.2)

set(SYSTEM_LIBRARIES libSDL.so libSDL_image.so libSDL_ttf.so libfreetype.so)

