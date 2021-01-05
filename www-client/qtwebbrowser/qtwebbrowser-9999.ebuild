# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 qmake-utils pax-utils

DESCRIPTION="Qt WebEngine based browser for embedded touch devices."
HOMEPAGE="https://doc.qt.io/QtWebBrowser/"
EGIT_REPO_URI="https://code.qt.io/qt-apps/qtwebbrowser.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtwebengine:5
	dev-qt/qtvirtualkeyboard:5
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtquickcontrols:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eqmake5 INSTALL_PREFIX="${D}/usr/bin/"
}

src_install() {
	emake install
	pax-mark -m "${D}/usr/bin/qtwebbrowser"
}
