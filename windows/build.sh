# !/bin/bash
#
# Generate the game executable for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

mkdir -p tmp/Windows bin/Windows/lib
cd tmp/Windows
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../windows/Windows.cmake
make
make install
cd ..
