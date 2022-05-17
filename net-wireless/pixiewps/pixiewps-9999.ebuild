# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="An offline Wi-Fi Protected Setup (WPS) brute-force utility"
HOMEPAGE="https://github.com/wiire-a/pixiewps"
EGIT_REPO_URI="https://github.com/wiire-a/pixiewps"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/openssl:0"
RDEPEND="${DEPEND} net-wireless/aircrack-ng"

src_compile() {
	emake OPENSSL=1
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README.md
	dodoc CHANGELOG.md
}
