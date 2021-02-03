# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="sfeed curses UI"
HOMEPAGE="ihttps://codemadness.org/git/sfeed/log.html"
EGIT_REPO_URI="git://git.codemadness.org/sfeed_curses"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND} net-news/sfeed"

src_compile() {
	emake LDFLAGS="${LDFLAGS} -lncursesw -ltinfow" all
}

src_install() {
	emake DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		MANPREFIX="${EPREFIX}/usr/share/man" \
		install
	dodoc README
}
