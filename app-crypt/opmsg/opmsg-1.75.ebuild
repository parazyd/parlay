# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="opmsg message encryption"
HOMEPAGE="https://github.com/stealth/opmsg"
SRC_URI="https://github.com/stealth/opmsg/archive/rel-${PV}s.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libressl contrib static"

DEPEND="
	!libressl? ( dev-libs/openssl )
	libressl? ( dev-libs/libressl )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-rel-${PV}s"


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
