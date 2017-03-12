# !/bin/bash
#
# Generate the game installer for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 12/03/2017

mkdir -p dist/linux/package/jtj/data
archivegen data.7z bin/Jack_the_Janitor lib resources
mv data.7z dist/linux/packages/jtj/data/
cd dist/linux
binarycreator -c config/config.xml -p packages JackTheJanitor.setup
mv JackTheJanitor.setup ../../
cd ../..
