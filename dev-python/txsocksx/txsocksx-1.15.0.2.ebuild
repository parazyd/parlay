# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Twisted client endpoints for SOCKS{4,4a,5}"
HOMEPAGE="https://github.com/habnabit/txsocksx https://pypi.org/project/txsocksx/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/twisted
	dev-python/Parsley
"
RDEPEND="${DEPEND}"
