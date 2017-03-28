# !/bin/bash
#
# Generate the game executable for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

# Directories
BIN_DIR=bin
BUILD_DIR=build

# System
SYSTEM=linux

mkdir -p $BUILD_DIR/$SYSTEM $BIN_DIR/$SYSTEM/lib
cd $BUILD_DIR/$SYSTEM
pwd
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../linux/Linux.cmake
make
#cp src/Jack_the_Janitor ../../bin/linux/
#cp ../../libs/linux/SDL-1.2/lib/libSDL-1.2.so.0 ../../bin/linux/lib/
#cp ../../libs/linux/SDL-1.2/lib/libSDL_image-1.2.so.0 ../../bin/linux/lib/
#cp ../../libs/linux/SDL-1.2/lib/libSDL_ttf-2.0.so.0 ../../bin/linux/lib/
#cp ../../libs/linux/FreeType-2.4/lib/libfreetype.so.6.5.0 ../../bin/linux/lib/
cd ..
