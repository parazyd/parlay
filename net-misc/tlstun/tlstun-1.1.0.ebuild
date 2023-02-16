# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple Go program to add TLS support to other TCP listeners"
HOMEPAGE="https://github.com/parazyd/tlstun"
SRC_URI="https://github.com/parazyd/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build
}

src_install() {
	dobin tlstun
	dodoc "README.md"
	doinitd "${FILESDIR}/initd/${PN}"
	doconfd "${FILESDIR}/confd/${PN}"

	default
}
