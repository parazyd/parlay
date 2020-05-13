# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="watch files/directories and run commands on any event"
HOMEPAGE="https://git.z3bra.org/wendy/log.html"
EGIT_REPO_URI="git://z3bra.org/wendy"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	default

	sed -i \
		-e "/^CFLAGS/{s|=|+=|;s|-O. | |g}" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s$| |g}" \
		config.mk || die
}

src_compile() {
	emake wendy
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
}
