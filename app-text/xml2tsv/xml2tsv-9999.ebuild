# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Simple xml-to-tsv converter"
HOMEPAGE="http://bitreich.org"
EGIT_REPO_URI="git://bitreich.org/xml2tsv"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="static"

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
	dodoc -r README.md
}
