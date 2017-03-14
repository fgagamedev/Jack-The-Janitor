# !/bin/bash
#
# Generate the game installer for Windows platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 12/03/2017

mkdir -p dist/windows/packages/jtj/data
rm -f dist/windows/packages/jtj/data/data.7z
archivegen data.7z bin/windows/ resources
mv data.7z dist/windows/packages/jtj/data/
cd dist/windows
binarycreator -c config/config.xml -p packages JackTheJanitorSetup.exe
mv JackTheJanitorSetup.exe ../../bin/windows
cd ../..
