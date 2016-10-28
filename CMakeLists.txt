cmake_minimum_required(VERSION 2.6)
project(Jack)
subdirs(src)

include(ExternalProject)

ExternalProject_Add(
    SDL 
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL-1.2.15.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/SDL-1.2
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)

ExternalProject_Add(
    SDL_image
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL_image-1.2.12.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/SDL-1.2
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)

ExternalProject_Add(
    FreeType
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/freetype-2.4.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/FreeType-2.4
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)

ExternalProject_Add(
    SDL_ttf
    DEPENDS FreeType
    PREFIX libs
    URL ${CMAKE_CURRENT_SOURCE_DIR}/libs/src/SDL_ttf-2.0.11.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/SDL-1.2 --with-freetype-prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/FreeType-2.4
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)
