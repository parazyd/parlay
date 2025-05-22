# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1 pypi

DESCRIPTION="Python FFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/rustyrussell/secp256k1-py https://pypi.org/project/secp256k1/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/libsecp256k1"
RDEPEND="${DEPEND}"
