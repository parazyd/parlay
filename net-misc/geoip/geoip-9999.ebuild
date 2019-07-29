# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs

DESCRIPTION="Short golang utility to fetch geoip data from an API"
HOMEPAGE="https://parazyd.org/git/geoip"
EGO_SRC="git.parazyd.org/geoip"
EGO_PN="${EGO_SRC}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	dobin geoip
}
