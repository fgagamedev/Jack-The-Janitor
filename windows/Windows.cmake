cmake_minimum_required(VERSION 2.6)
set(CMAKE_SYSTEM_NAME Windows)

set(CMAKE_C_COMPILER i686-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER i686-w64-mingw32-g++)
set(CMAKE_RC_COMPILER i686-w64-mingw32-windres)
set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32/)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(MINGW_BIN_DIR /usr/bin)
set(MINGW_LIB_DIR /usr/x86_64-w64-mingw32/lib)
set(MINGW_INCLUDE_DIR /usr/x86_64-w64-mingw32/include)

set(LIBPNG_CONFIGURE_OPTIONS --build=i686-unknown-linux --host=i686-w64-mingw32 --with-zlib-prefix=${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/zlib-1.2)

set(SDL_CONFIGURE_OPTIONS --build=i686-unknown-linux --host=i686-w64-mingw32)
set(SDL_IMAGE_CPPFLAGS -I/${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/zlib-1.2/include)
set(SDL_IMAGE_LDFLAGS -L/${CMAKE_CURRENT_SOURCE_DIR}/libs/${CMAKE_SYSTEM_NAME}/zlib-1.2/lib)
