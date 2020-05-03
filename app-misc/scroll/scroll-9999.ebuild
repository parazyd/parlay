# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="scrollbackbuffer program for st"
HOMEPAGE="https://git.suckless.org/scroll"
EGIT_REPO_URI="https://git.suckless.org/scroll"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="savedconfig"

DEPEND=""
RDEPEND=""

src_prepare() {
	default

	sed -i \
		-e "/^CFLAGS/{s|=|+=|;s|-O. | |g}" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s$| |g}" \
		config.mk || die

	restore_config config.h
}

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	DOCS="README TODO perf.sh up.sh up.log" einstalldocs
	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
}
