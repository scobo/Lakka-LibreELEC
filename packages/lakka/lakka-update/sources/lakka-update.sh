#!/bin/bash

source /etc/os-release

#MIRROR=http://le.builds.lakka.tv
MIRROR=http://scottpowered.com/lakka

FILE=`wget $MIRROR/${LIBREELEC_ARCH}/.index -q -O - | head -1`
#FILE=Lakka-RPi2.arm-lakka.img.gz
#URL=$MIRROR/${LIBREELEC_ARCH}/$FILE
#URL=https://github.com/scobo/Lakka-LibreELEC/archive/$FILE
URL=https://github.com/scobo/Lakka-LibreELEC/releases/download/$FILE

rm -rf ~/.update/*

echo ":: Downloading upgrade"
wget -P ~/.update/ $URL

if [ -z "~/.update/$FILE" ]; then
	echo "Something went wrong during the download."
	exit 1
fi

echo ":: Done, you can now reboot"
