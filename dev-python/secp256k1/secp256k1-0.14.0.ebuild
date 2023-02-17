# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 git-r3

DESCRIPTION="Python FFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/rustyrussell/secp256k1-py https://pypi.org/project/secp256k1/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libsecp256k1"
RDEPEND="${DEPEND}"