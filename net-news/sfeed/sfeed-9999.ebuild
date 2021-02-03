# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="RSS and Atom feed parser"
HOMEPAGE="ihttps://codemadness.org/git/sfeed/log.html"
EGIT_REPO_URI="git://git.codemadness.org/sfeed"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		MANPREFIX="${EPREFIX}/usr/share/man"\
		install
	dodoc README README.xml sfeedrc.example
}
