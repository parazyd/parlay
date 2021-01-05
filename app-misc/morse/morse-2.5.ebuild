# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A morse-code training program and QSO generator"
HOMEPAGE="http://www.catb.org/~esr/morse/"
SRC_URI="http://www.catb.org/~esr/morse-classic/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	sed -i \
		-e "s/DEVICE = PA/DEVICE = ALSA/" \
		Makefile || die
}

src_compile() {
	emake all
}

src_install() {
	dobin morse QSO
	doman morse.1 QSO.1
	dodoc README HISTORY test_input
}
