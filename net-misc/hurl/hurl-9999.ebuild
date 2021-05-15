# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Gopher/HTTP/HTTPS file grabber"
HOMEPAGE="https://git.codemadness.org/hurl/"
EGIT_REPO_URI="git://git.codemadness.org/hurl"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/libretls
	dev-libs/libbsd
"
RDEPEND=""

PATCHES=( "${FILESDIR}/linux.patch" )

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README hurl.vt
}
