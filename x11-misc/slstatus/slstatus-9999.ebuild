# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="lightweight status monitor for window managers which use WM_NAME (eg. dwm)"
HOMEPAGE="https://github.com/drkhsh/slstatus"
EGIT_REPO_URI="https://github.com/drkhsh/slstatus"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -i \
		-e "/^CDFLAGS/{s|=|+=|g;s|-O. | |g}" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s | |g}" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		config.mk || die
	sed -i \
		-e '/@echo CC/d' \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die

	restore_config config.h
}

src_compile() {
	emake CC=$(tc-getCC) slstatus
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README.md

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
}
