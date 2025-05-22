# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Simple utility for git repository permission management"
HOMEPAGE="https://github.com/parazyd/git-restrict"
EGIT_REPO_URI="https://git.parazyd.org/git-restrict.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README.md
	dodoc -r contrib
}
