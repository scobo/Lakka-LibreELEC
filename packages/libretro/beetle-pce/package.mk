################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="beetle-pce"
PKG_VERSION="3731ec9"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-pce-fast-libretro"
PKG_URL="https://github.com/libretro/beetle-pce-fast-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Standalone port of Mednafen PCE Fast to libretro."
PKG_LONGDESC="Standalone port of Mednafen PCE Fast to libretro."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  mv $BUILD/beetle-pce-fast-libretro-$PKG_VERSION* $BUILD/$PKG_NAME-$PKG_VERSION
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_pce_fast_libretro.so $INSTALL/usr/lib/libretro/
}
