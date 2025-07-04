# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-24 JELOS (https://github.com/JustEnoughLinuxOS)
# Copyright (C) 2024-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="es-theme-art-book-next"
PKG_VERSION="5db8b08c41be87843cf47e8b9de605ed7d26c81b"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/anthonycaccese/art-book-next-es"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Art Book Next"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
    cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
}
