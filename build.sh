# !/bin/bash
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

mkdir -p build lib
cd build
cmake ..
make
make install
cd ..
