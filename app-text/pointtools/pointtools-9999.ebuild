# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Scripts and ways to present point files"
HOMEPAGE="http://git.r-36.net/pointtools"
EGIT_REPO_URI="http://git.r-36.net/pointtools"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-text/utf8expr"
RDEPEND=""

src_install() {
	dobin bin/md2point bin/point2pdf
	dodoc README.md examples/hello/*
}
