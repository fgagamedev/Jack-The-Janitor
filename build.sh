# !/bin/bash
# Author: Edson Alves - edsonalves@unb.br
# Date: 09/03/2017

# Compiles the game
mkdir -p build lib
cd build
cmake ..
make
make install
cd ..

# Generates the installer
mkdir -p dist/linux/package/jtj/data
archivegen data.7z bin/Jack_the_Janitor lib resources
mv data.7z dist/linux/packages/jtj/data/
cd dist/linux
binarycreator -c config/config.xml -p packages JackTheJanitor.setup
mv JackTheJanitor.setup ../../
cd ../..
