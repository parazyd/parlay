# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Python module to generate ATOM feeds, RSS feeds and Podcasts"
HOMEPAGE="https://github.com/lkiesow/python-feedgen https://pypi.org/project/feedgen/"

LICENSE="LGPL-3 BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
