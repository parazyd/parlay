# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1 git-r3

DESCRIPTION="A screamingly fast Python WSGI server written in C"
HOMEPAGE="https://github.com/jonashaag/bjoern https://pypi.org/project/bjoern/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
EGIT_REPO_URI="https://github.com/jonashaag/bjoern"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libev
	net-libs/http-parser"
RDEPEND="${DEPEND}"
