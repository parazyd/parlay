# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1 git-r3

DESCRIPTION="Commandline program to download images from several image sites"
HOMEPAGE="https://github.com/mikf/gallery-dl https://pypi.org/project/gallery-dl/"
EGIT_REPO_URI="https://github.com/mikf/gallery-dl"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	media-video/ffmpeg
	net-misc/youtube-dl
"
DEPEND="${RDEPEND}"
