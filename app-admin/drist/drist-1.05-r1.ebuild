# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="small remote deployment tool"
HOMEPAGE="https://dataswamp.org/~solene/2018-11-29-drist-intro.html"
EGIT_REPO_URI="git://bitreich.org/drist"
EGIT_COMMIT="v${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

src_install() {
	dobin drist
	doman drist.1
	dodoc -r examples
}
