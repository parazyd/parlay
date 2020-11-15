# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="A decompression library for rar, tar and zip archives"
HOMEPAGE="https://github.com/selmf/unarr"
EGIT_REPO_URI="https://github.com/selmf/unarr"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/rar-get-name.patch"
	"${FILESDIR}/tar-get-name.patch"
	"${FILESDIR}/zip-get-name.patch"
)
