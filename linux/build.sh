# !/bin/bash
#
# Generate the game executable for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

mkdir -p tmp/linux bin/linux/lib
cd tmp/linux
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../linux/Linux.cmake
make
make install
cd ..
