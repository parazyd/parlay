# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
inherit distutils-r1 git-r3

DESCRIPTION="The Swiss Army Knife of the Bitcoin protocol"
HOMEPAGE="https://github.com/petertodd/python-bitcoinlib https://pypi.org/project/python-bitcoinlib/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
EGIT_REPO_URI="https://github.com/petertodd/python-bitcoinlib"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
