cmake_minimum_required(VERSION 2.6)
project(Jack)
subdirs(src)

include(ExternalProject)

ExternalProject_Add(
    SDL 
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL-1.2.15.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2 --enable-video-x11 --enable-x11-shared --enable-video-x11-vm
    BUILD_COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libs/SDL_x11sym.h ${CMAKE_CURRENT_SOURCE_DIR}/tmp/${CMAKE_SYSTEM_NAME}/libs/src/SDL/src/video/x11/ && $(MAKE)
    INSTALL_COMMAND $(MAKE) install COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2/lib/libSDL-1.2.so.0 ${Jack_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/lib/
)

ExternalProject_Add(
    SDL_image
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL_image-1.2.12.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2
    BUILD_COMMAND $(MAKE)
    INSTALL_COMMAND $(MAKE) install COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2/lib/libSDL_image-1.2.so.0 ${Jack_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/lib/
)

ExternalProject_Add(
    FreeType
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/freetype-2.4.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/FreeType-2.4
    BUILD_COMMAND $(MAKE)
    INSTALL_COMMAND $(MAKE) install
)

ExternalProject_Add(
    SDL_ttf
    DEPENDS FreeType
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL_ttf-2.0.11.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2 --with-freetype-prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/FreeType-2.4
    BUILD_COMMAND $(MAKE)
    INSTALL_COMMAND $(MAKE) install COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/SDL-1.2/lib/libSDL_ttf-2.0.so.0 ${Jack_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/lib/
)
