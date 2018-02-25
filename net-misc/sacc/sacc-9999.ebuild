# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="saccomys, simple console gopher client"
HOMEPAGE="gopher://bitreich.org/1/scm/sacc"
EGIT_REPO_URI="https://git.parazyd.org/sacc.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="ncurses savedconfig static"

DEPEND="ncurses? ( sys-libs/ncurses:0 )"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	if use ncurses; then
		echo "UI=ti" >> config.mk
		echo "LIBS=-lcurses" >> config.mk
	else
		sed -e 's/LIBS=.*/UI=txt/' -i config.mk
	fi
	if use static; then
		echo "LDFLAGS+=-static" >> config.mk
	fi

	restore_config config.h
}

src_compile() {
	emake sacc
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
}
