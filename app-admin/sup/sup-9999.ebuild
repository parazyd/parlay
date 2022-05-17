# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 savedconfig

DESCRIPTION="small and secure tool for privilege escalation"
HOMEPAGE="https://parazyd.org/git/sup/"
EGIT_REPO_URI="https://git.parazyd.org/sup.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="savedconfig"

DEPEND=""
RDEPEND=""

src_prepare() {
	default
	restore_config config.h
}

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
}
