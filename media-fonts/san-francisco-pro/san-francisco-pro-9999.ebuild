# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

DESCRIPTION="The entire collection of San Francisco Pro Fonts"
HOMEPAGE="https://developer.apple.com/fonts/"
EGIT_REPO_URI="https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts"

LICENSE="Apple"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="binchecks strip"
FONT_SUFFIX="otf"

src_install() {
	FONT_S="${WORKDIR}/${P}/" font_src_install
}
