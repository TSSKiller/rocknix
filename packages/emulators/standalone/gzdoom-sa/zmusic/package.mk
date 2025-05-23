# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="zmusic"
PKG_VERSION="1.1.14"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/ZDoom/ZMusic"
PKG_URL="https://github.com/ZDoom/ZMusic/archive/refs/tags/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain zmusic:host"
PKG_LONGDESC="GZDoom's music system as a standalone library"
PKG_TOOLCHAIN="cmake-make"

make_host() {
  [ -d "${PKG_BUILD}/build" ] && rm -rf ${PKG_BUILD}/build
  mkdir ${PKG_BUILD}/build
  cd ${PKG_BUILD}/build
  unset HOST_CMAKE_OPTS
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

make_target() {
  [ -d "${PKG_BUILD}/build" ] && rm -rf ${PKG_BUILD}/build
  mkdir ${PKG_BUILD}/build
  cd ${PKG_BUILD}/build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/usr/{lib,include}
  cp -f ${PKG_BUILD}/build/source/libzmusic* ${TOOLCHAIN}/usr/lib/
  cp -f ${PKG_BUILD}/include/zmusic.h ${TOOLCHAIN}/usr/include
}

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/{lib,include}
  cp -f ${PKG_BUILD}/build/source/libzmusic* ${SYSROOT_PREFIX}/usr/lib/
  cp -f ${PKG_BUILD}/include/zmusic.h ${SYSROOT_PREFIX}/usr/include

  mkdir -p ${INSTALL}/usr/lib
  cp -f ${PKG_BUILD}/build/source/libzmusic* ${INSTALL}/usr/lib
}
