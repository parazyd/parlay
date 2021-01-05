# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="expr(1) for utf8"
HOMEPAGE="http://git.r-36.net/utf8expr"
EGIT_REPO_URI="http://git.r-36.net/utf8expr"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="static"

DEPEND=""
RDEPEND=""

src_prepare() {
	default

	sed -i \
		-e "/^CDFLAGS/{s|=|+=|g;s|-O. | |g}" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s | |g}" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		config.mk || die

	if use static; then
		echo "LDFLAGS += -static" >> config.mk
	fi
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
