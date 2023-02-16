# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs

DESCRIPTION="Simple Go program to add TLS support to other listeners"
HOMEPAGE="https://github.com/parazyd/tlstun"
EGO_SRC="github.com/parazyd/tlstun"
EGO_PN="${EGO_SRC}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	dobin tlstun
	dodoc "src/${EGO_SRC}/README.md"
	doinitd "${FILESDIR}/initd/${PN}"
	doconfd "${FILESDIR}/confd/${PN}"
}
