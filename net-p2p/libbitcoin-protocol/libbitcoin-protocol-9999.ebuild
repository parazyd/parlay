# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Bitcoin Blockchain Query Protocol Library"
HOMEPAGE="https://libbitcoin.info"
EGIT_REPO_URI="https://github.com/libbitcoin/${PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs debug test +mbedtls"

DEPEND="
	mbedtls? ( >=net-libs/mbedtls-2.12.0 )
	>=dev-libs/boost-1.72.0:=[threads(+)]
	>=net-libs/zeromq-4.3.2
	>=net-p2p/libbitcoin-system-${PV}
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_with test tests) \
		$(use_with mbedtls) \
		$(use_enable static-libs static) \
		$(use_enable debug ndebug)
}
