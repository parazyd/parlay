# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="command line utilities to work with devicess based on Allwinner SoC"
HOMEPAGE="https://github.com/linux-sunxi/sunxi-tools"
EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-tools"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"

src_compile() {
	emake tools
	emake misc
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install-tools
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install-misc
	dodoc README.md

	dosym /usr/bin/sunxi-fexc usr/bin/fex2bin
	dosym /usr/bin/sunxi-fexc usr/bin/bin2fex
}
