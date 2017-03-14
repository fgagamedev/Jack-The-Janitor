# !/bin/bash
#
# Generate the game installer for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 12/03/2017

mkdir -p dist/linux/packages/jtj/data
rm -f dist/linux/packages/jtj/data/data.7z
archivegen data.7z bin/linux/ resources
mv data.7z dist/linux/packages/jtj/data/
cd dist/linux
binarycreator -c config/config.xml -p packages JackTheJanitorSetup.sh
mv JackTheJanitorSetup.sh ../../bin/linux
cd ../..
