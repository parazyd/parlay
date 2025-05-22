# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1 pypi

DESCRIPTION="CoinGecko API wrapper"
HOMEPAGE="https://github.com/man-c/pycoingecko https://pypi.org/project/pycoingecko/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/requests[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
