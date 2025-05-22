# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Python tool for converting Markdown to PDF"
HOMEPAGE="https://github.com/parazyd/md2pdf"
SRC_URI="https://github.com/parazyd/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/markdown dev-python/weasyprint"

src_install() {
	dobin md2pdf
	dodoc README.md
}
