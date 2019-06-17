# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Brute force attack against Wifi Protected Setup (WPS)"
HOMEPAGE="https://github.com/t6x/reaver-wps-fork-t6x"
EGIT_REPO_URI="https://github.com/t6x/reaver-wps-fork-t6x"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	net-libs/libpcap
	net-wireless/pixiewps
"
RDEPEND="
	${DEPEND}
"

src_configure() {
	cd src
	econf
}

src_compile() {
	cd src
	emake
}

src_install() {
	cd src
	emake DESTDIR="${D}" install

	cd ../tools
	dobin logfilter.py

	cd ../docs
	dodoc README README.REAVER README.WASH
	doman reaver.1
}
