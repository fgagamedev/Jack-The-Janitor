# !/bin/bash
#
# Generate the game executable for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

mkdir -p tmp/Linux bin/Linux/lib
cd tmp/Linux
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../linux/Linux.cmake
make
make install
cd ..
