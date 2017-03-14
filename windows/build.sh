# !/bin/bash
#
# Generate the game executable for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

mkdir -p tmp/windows bin/windows/lib
cd tmp/windows
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../windows/Windows.cmake
make
make install
cd ..
