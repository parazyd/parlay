# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 linux-info linux-mod savedconfig

DESCRIPTION="A linux kernel module to fight against police terror"
HOMEPAGE="https://github.com/parazyd/protecc"
EGIT_REPO_URI="https://github.com/parazyd/protecc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="savedconfig"

BUILD_TARGETS="all"
CONFIG_CHECK="USB"
MODULE_NAMES="protecc(misc:${S})"

src_prepare() {
	default
	restore_config config.h
}

src_compile() {
	BUILD_PARAMS="KERNELDIR=${KV_OUT_DIR} M=${S}"

	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
	dodoc README.md
	save_config config.h
}

pkg_postinst() {
	einfo "This package has USE=savedconfig. Make sure you set it up!"
}
