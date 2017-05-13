# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="opmsg message encryption"
HOMEPAGE="https://github.com/stealth/opmsg"
EGIT_REPO_URI="https://github.com/stealth/opmsg.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="libressl contrib static"

DEPEND="
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use libressl && epatch "${FILESDIR}/${PN}-libressl.patch"
	use static   && epatch "${FILESDIR}/${PN}-static.patch"
}

src_compile() {
	cd src
	emake
	use contrib && emake contrib
	cd -
}

src_install() {
	dobin src/opmsg
	use contrib && {
		dobin src/opmux
		dobin src/opcoin
	}
}
