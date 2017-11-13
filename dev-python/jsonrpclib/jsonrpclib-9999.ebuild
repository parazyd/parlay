# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

if [[ ${PV} == "9999" ]] ; then
	# EGIT_REPO_URI="https://github.com/joshmarshall/jsonrpclib.git"
	# this repo has python3 patches
	EGIT_REPO_URI="https://github.com/prs247au/jsonrpclib.git"
	inherit git-r3
else
	SRC_URI="https://github.com/joshmarshall/jsonrpclib/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="amd64 arm mips x86"

DESCRIPTION="python implementation of the JSON-RPC spec (1.0 and 2.0)"
HOMEPAGE="https://github.com/joshmarshall/jsonrpclib"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/simplejson"
