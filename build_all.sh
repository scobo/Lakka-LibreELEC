#!/bin/bash

rm -rf target/

>&2 echo "Generic.x86_64"
DISTRO=Esper PROJECT=Generic ARCH=x86_64 make image -j8
>&2 echo "Generic.i386"
DISTRO=Esper PROJECT=Generic ARCH=i386 make image -j8
>&2 echo "RPi.arm + noobs"
DISTRO=Esper PROJECT=RPi ARCH=arm make noobs -j8
>&2 echo "RPi2.arm + noobs"
DISTRO=Esper PROJECT=RPi2 ARCH=arm make noobs -j8
>&2 echo "Allwinner.arm"
DISTRO=Esper PROJECT=Allwinner SYSTEM=Bananapi ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=Cubieboard2 ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=Cubietruck ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_2 ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_lite ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_one ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_pc ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_plus ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=orangepi_plus2e ARCH=arm make image -j8
DISTRO=Esper PROJECT=Allwinner SYSTEM=nanopi_m1_plus ARCH=arm make image -j8
>&2 echo "imx6.cuboxi.arm"
DISTRO=Esper PROJECT=imx6 SYSTEM=cuboxi ARCH=arm make image -j8
>&2 echo "imx6.udoo.arm"
DISTRO=Esper PROJECT=imx6 SYSTEM=udoo ARCH=arm make image -j8
>&2 echo "OdroidC1.arm"
DISTRO=Esper PROJECT=OdroidC1 ARCH=arm make image -j8
>&2 echo "Odroid_C2.arm"
DISTRO=Esper PROJECT=Odroid_C2 ARCH=arm make image -j8
>&2 echo "OdroidXU3.arm"
DISTRO=Esper PROJECT=OdroidXU3 ARCH=arm make image -j8
>&2 echo "WeTek_Core.arm"
DISTRO=Esper PROJECT=WeTek_Core ARCH=arm make image -j8
>&2 echo "WeTek_Hub.arm"
DISTRO=Esper PROJECT=WeTek_Hub ARCH=arm make image -j8
>&2 echo "WeTek_Play.arm"
DISTRO=Esper PROJECT=WeTek_Play ARCH=arm make image -j8
>&2 echo "WeTek_Play_2.arm"
DISTRO=Esper PROJECT=WeTek_Play_2 ARCH=arm make image -j8
>&2 echo "Gamegirl.arm"
DISTRO=Esper PROJECT=Gamegirl ARCH=arm make image -j8
>&2 echo "S8X2.arm"
DISTRO=Esper PROJECT=S8X2 SYSTEM=S82 ARCH=arm make image -j8
DISTRO=Esper PROJECT=S8X2 SYSTEM=M8 ARCH=arm make image -j8
DISTRO=Esper PROJECT=S8X2 SYSTEM=T8 ARCH=arm make image -j8
DISTRO=Esper PROJECT=S8X2 SYSTEM=MXIII-1G ARCH=arm make image -j8
DISTRO=Esper PROJECT=S8X2 SYSTEM=MXIII-PLUS ARCH=arm make image -j8
DISTRO=Esper PROJECT=S8X2 SYSTEM=X8H-PLUS ARCH=arm make image -j8
>&2 echo "S805.arm"
DISTRO=Esper PROJECT=S805 SYSTEM=MXQ ARCH=arm make image -j8
DISTRO=Esper PROJECT=S805 SYSTEM=HD18Q ARCH=arm make image -j8
DISTRO=Esper PROJECT=S805 SYSTEM=M201C ARCH=arm make image -j8
DISTRO=Esper PROJECT=S805 SYSTEM=M201D ARCH=arm make image -j8
DISTRO=Esper PROJECT=S805 SYSTEM=MK808B-Plus ARCH=arm make image -j8
>&2 echo "S905.arm"
DISTRO=Esper PROJECT=S905 ARCH=arm make image -j8
>&2 echo "TinkerBoard.arm"
#DISTRO=Esper PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm make image -j8
>&2 echo "ROCK64.arm"
#DISTRO=Esper PROJECT=Rockchip DEVICE=ROCK64 ARCH=arm make image -j8
#>&2 echo "MiQi.arm"
#DISTRO=Esper PROJECT=Rockchip DEVICE=MiQi ARCH=arm make image -j8

rm target/*.kernel
rm target/*.system

for f in target/*; do
  md5sum $f > $f.md5
  sha256sum $f > $f.sha256
done

for f in target/*; do
  #dir=`echo $f | sed -e 's/target\/Lakka-\(.*\)-\(.*\)-devel-\(.*\)/\1/'`
  dir=`echo $f | sed -e 's/target\/Esper-\(.*\)-\(.*\)-devel-\(.*\)/\1/'`
  #dir=`echo $f | sed -e 's/target\/Lakka-\(.*\)-2.1\(.*\)/\1/'`
  mkdir -p target/$dir
  mv $f target/$dir/
done

#scp -r target/* lakka@sources.lakka.tv:sources/nightly/
