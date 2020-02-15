# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Scripts and ways to present point files"
HOMEPAGE="gopher://bitreich.org/1/scm/pointtools/log.gph"
EGIT_REPO_URI="git://bitreich.org/pointtools"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-text/utf8expr"
RDEPEND=""

PATCHES=( "${FILESDIR}/makefile-fix.patch" )

src_install() {
	emake install
	dodoc README.md
	dodoc -r examples
}
