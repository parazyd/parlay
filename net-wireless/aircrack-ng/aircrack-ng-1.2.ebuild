# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools eutils

DESCRIPTION="WLAN tools for breaking 802.11 WEP/WPA keys"
HOMEPAGE="https://www.aircrack-ng.org/"
SRC_URI="https://download.aircrack-ng.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="libressl"

DEPEND="
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl:0 )
	dev-db/sqlite
	net-libs/libpcap
	dev-libs/libpcre
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
