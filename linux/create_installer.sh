# !/bin/bash
#
# Generate the game installer for Linux platform.
#
# Author: Edson Alves - edsonalves@unb.br
# Date: 12/03/2017

# Variables
SYSTEM=linux
CUR_DIR=`pwd`
BUILD_DIR=build/$SYSTEM
DIST_BIN_DIR=dist/$SYSTEM/bin

# Generates Debin package (.deb)
function debian_package
{
    echo "Building .deb package..."
    cd $BUILD_DIR
    pwd
    cpack
    cd $CUR_DIR
    mkdir -p $DIST_BIN_DIR
    mv $BUILD_DIR/*.deb $DIST_BIN_DIR/
}
#    echo "Done"
#fi

#mv jtj-1.0.0-linux.deb ../../bin/linux
#cd ..

# Main
case $1 in
    "all")
        echo "All"
        debian_package
        ;;

    "deb")
        echo "Deb"
        debian_package
        ;;

    "qt")
        echo "Qt"
        ;;

    *)
        echo "Usage: create_installer.sh [all|qt|deb]"
        exit 1
esac

# Qt installer (user friendly)
#mkdir -p dist/linux/packages/jtj/data
#rm -f dist/linux/packages/jtj/data/data.7z
#archivegen data.7z bin/linux/ resources
#mv data.7z dist/linux/packages/jtj/data/
#cd dist/linux
#binarycreator -c config/config.xml -p packages JackTheJanitorSetup.sh
#mv JackTheJanitorSetup.sh ../../bin/linux
#cd ../..
#
