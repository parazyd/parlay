# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Androguard is a full python tool to play with Android files."
HOMEPAGE="https://github.com/androguard/androguard https://pypi.org/project/androguard/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}a1.tar.gz"

S="${WORKDIR}/${P}a1"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=( "${FILESDIR}/requirements.patch" )

DEPEND="
	>=dev-python/networkx-2.2[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/pydot-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
