# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="The Bitcoin Development Library"
HOMEPAGE="https://libbitcoin.info"
EGIT_REPO_URI="https://github.com/libbitcoin/${PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs debug +icu test +doc +png"

DEPEND="
	png? (
		>=media-libs/libpng-1.6.37:=
		>=media-gfx/qrencode-3.4.4:=
	)
	icu? (
		>=dev-libs/icu-51.2:=
		>=dev-libs/boost-1.72.0:=[threads(+),icu(+)]
	)
	>=dev-libs/boost-1.72.0:=[threads(+)]
	>dev-libs/libsecp256k1-0.1_pre20200911:=[recovery,schnorr]
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/libsecp256k1-relax.patch" )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_with icu) \
		$(use_with test tests) \
		$(use_with doc examples) \
		$(use_with png) \
		$(use_with png qrencode) \
		$(use_enable static-libs static) \
		$(use_enable debug ndebug)
}
