# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils multilib-minimal

DESCRIPTION="CELT is a very low delay audio codec designed for high-quality communications"
HOMEPAGE="http://www.celt-codec.org/"
SRC_URI="http://downloads.xiph.org/releases/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="ogg static-libs"

DEPEND="ogg? ( media-libs/libogg )"
RDEPEND="${DEPEND}"
DOCS=( README TODO )

multilib_src_configure() {
	# ogg is for the binaries
	local myconf="--without-ogg"
	multilib_is_native_abi && myconf="$(use_with ogg ogg /usr)"

	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		${myconf}
}

multilib_src_install_all() {
	prune_libtool_files
	einstalldocs
}
