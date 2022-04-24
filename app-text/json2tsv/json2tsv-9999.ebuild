# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Simple json-to-tsv converter"
HOMEPAGE="git://codemadness.org/json2tsv"
EGIT_REPO_URI="git://codemadness.org/json2tsv"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	default

	sed -e 's@^MANPREFIX = .*@MANPREFIX = ${PREFIX}/share/man@' -i Makefile
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc -r README
}
