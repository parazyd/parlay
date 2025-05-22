# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Tools to present point files"
HOMEPAGE="http://bitreich.org"
EGIT_REPO_URI="git://bitreich.org/pointtools"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="static"

DEPEND="sys-libs/ncurses:0"

src_prepare() {
	default

	if use static; then
		echo "LDFLAGS += -static" >> config.mk
	fi
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc -r README.md examples
}
