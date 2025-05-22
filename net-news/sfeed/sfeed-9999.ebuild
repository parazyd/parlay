# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="RSS and Atom feed parser"
HOMEPAGE="https://codemadness.org/git/sfeed/log.html"
EGIT_REPO_URI="git://git.codemadness.org/sfeed"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="+mono-theme mono-highlight-theme newsboat-theme templeos-theme"
REQUIRED_USE="^^ ( mono-theme mono-highlight-theme newsboat-theme templeos-theme )"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -e 's/^SFEED_CURSES_LDFLAGS = .*/SFEED_CURSES_LDFLAGS = ${LDFLAGS} -lncurses -ltinfo/' \
		-i Makefile

	if use mono-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = mono/' -i Makefile
	elif use mono-highlight-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = mono_highlight/' -i Makefile
	elif use newsboat-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = newsboat/' -i Makefile
	elif use templeos-theme; then
		sed -e 's/SFEED_THEME =.*/SFEED_THEME = templeos/' -i Makefile
	fi
}

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		MANPREFIX="${EPREFIX}/usr/share/man" \
		DOCPREFIX="${EPREFIX}/usr/share/doc/${P}" \
		install
}
