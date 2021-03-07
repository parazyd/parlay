# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="An Obfuscation-Neglect Android Malware Scoring System"
HOMEPAGE="https://github.com/quark-engine/quark-engine https://pypi.org/project/quark-engine/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

PATCHES=( "${FILESDIR}/disable-tests-package.patch" )

DEPEND="
	dev-python/GitPython[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	dev-vcs/git
	media-gfx/graphviz
"
