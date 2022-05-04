# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Fast ISO8601 date time parser for Python written in C"
HOMEPAGE="https://github.com/closeio/ciso8601 https://pypi.org/project/ciso8601/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-python/pytz )"
RDEPEND="${DEPEND}"