# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="tiny but full expression evaluator"
HOMEPAGE="https://parazyd.org/git/e/"
EGIT_REPO_URI="https://git.parazyd.org/e.git"

LICENSE="GPL-2"
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
	emake all
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README.md
}
