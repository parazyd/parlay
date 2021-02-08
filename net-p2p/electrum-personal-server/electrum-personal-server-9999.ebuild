# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1 git-r3

DESCRIPTION="Maximally lightweight electrum server for a single user"
HOMEPAGE="https://github.com/chris-belcher/electrum-personal-server/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
EGIT_REPO_URI="https://git.parazyd.org/electrum-personal-server"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	default
	sed -e "s@share/doc/electrum-personal-server@&-${PV}@" -i setup.py
	distutils-r1_src_prepare
}
