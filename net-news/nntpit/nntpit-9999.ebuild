# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools eutils

DESCRIPTION="Minimalist reddit2nntp gateway"
HOMEPAGE="https://github.com/taviso/nntpit"
EGIT_REPO_URI="https://github.com/taviso/nntpit"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/libev
	dev-libs/glib
	dev-libs/json-c
	net-misc/curl
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${ED}" install || die "emake install failed"
	dodoc README.md
}
