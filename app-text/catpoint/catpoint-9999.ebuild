# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

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

	sed -i \
		-e "/^CDFLAGS/{s|=|+=|g;s|-O. | |g}" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s | |g}" \
		-e "s@^LIBS = .*@& -ltinfow@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		config.mk || die

	if use static; then
		echo "LDFLAGS += -static" >> config.mk
	fi
}

src_compile() {
	emake catpoint
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README.md showoff/*.txt
}
