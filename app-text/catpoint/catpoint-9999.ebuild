# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="curses presentation tool"
HOMEPAGE="git://bitreich.org/catpoint"
EGIT_REPO_URI="git://bitreich.org/catpoint"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="static"

DEPEND="sys-libs/ncurses:0"
RDEPEND=""

src_prepare() {
	default

	sed 's/^CATPOINT_LDFLAGS = .*/& -ltinfow/' -i Makefile || die
}

src_compile() {
	emake catpoint
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README.md PATH-MAX-LIMIT.md TOOLS showoff/*.txt
}
