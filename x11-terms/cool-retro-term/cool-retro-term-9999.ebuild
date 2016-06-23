# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3

DESCRIPTION="A good looking terminal emulator which mimics the old cathode display"
HOMEPAGE="https://github.com/Swordfish90/cool-retro-term"

EGIT_REPO_URI="git://github.com/Swordfish90/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtquickcontrols:5[widgets]
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtdeclarative:5[localstorage]
"

RDEPEND="${DEPEND}"

src_configure() {
	local myeqmakeargs=(
		PREFIX="${EPREFIX}/usr"
	)
	eqmake5 ${myeqmakeargs[@]}
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
}

