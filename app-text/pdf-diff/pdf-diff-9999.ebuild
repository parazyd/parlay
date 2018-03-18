# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_6)

inherit git-r3 distutils-r1

DESCRIPTION="A PDF comparison utility in Python"
HOMEPAGE="https://github.com/JoshData/pdf-diff"
EGIT_REPO_URI="https://github.com/JoshData/pdf-diff"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	app-text/poppler[utils]
	dev-libs/libxslt
	dev-libs/libxml2
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/diff-match-patch[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
