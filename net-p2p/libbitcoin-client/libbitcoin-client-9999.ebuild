# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Bitcoin Client Query Library"
HOMEPAGE="https://libbitcoin.info"
EGIT_REPO_URI="https://github.com/libbitcoin/${PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs debug +doc test"

DEPEND="
	>=dev-libs/boost-1.62.0:=[threads(+)]
	>=net-p2p/libbitcoin-system-${PV}
	>=net-p2p/libbitcoin-protocol-${PV}
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_with test tests) \
		$(use_with doc examples) \
		$(use_enable static-libs static) \
		$(use_enable debug ndebug)
}
