# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Time Based Text"
HOMEPAGE="https://www.dyne.org/software/tbt/"
SRC_URI="https://files.dyne.org/${PN}/releases/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/slang"
RDEPEND="${DEPEND}"

src_configure() {
	econf
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${ED}" install || die "emake install failed"
}
