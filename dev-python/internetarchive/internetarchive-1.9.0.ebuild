# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_{6,7}} )
inherit distutils-r1

DESCRIPTION="A Python and Command-Line Interface to Archive.org"
HOMEPAGE="https://github.com/jjjake/internetarchive"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/backports-csv
	dev-python/schema
	dev-python/clint
	dev-python/docopt
	dev-python/jsonpatch
"
RDEPEND="${DEPEND}"
