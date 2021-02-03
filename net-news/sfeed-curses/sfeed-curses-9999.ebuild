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
IUSE="+mono-theme newsboat-theme templeos-theme"
REQUIRED_USE="^^ ( mono-theme newsboat-theme templeos-theme )"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND} net-news/sfeed"

src_prepare() {
	default

	if use mono-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = mono/' -i Makefile
	elif use newsboat-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = newsboat/' -i Makefile
	elif use templeos-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = templeos/' -i Makefile
	fi
}

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
