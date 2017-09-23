# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="simple markup - markdown like syntax"
HOMEPAGE="https://github.com/Gottox/smu"
EGIT_REPO_URI="https://github.com/Gottox/smu"

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
	emake smu
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc documentation
	dodoc testdoc
}
