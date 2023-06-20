# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1 pypi

DESCRIPTION="qBittorrent Web API Client"
HOMEPAGE="https://github.com/rmartin16/qbittorrent-api/ https://pypi.org/project/qbittorrent-api/"
PYPI_NO_NORMALIZE=1
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rm -rf tests
}
