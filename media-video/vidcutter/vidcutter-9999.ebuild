# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1 git-r3

DESCRIPTION="Qt5-based application for video trimming/splitting and merging/joining."
HOMEPAGE="https://github.com/ozmartian/vidcutter"
EGIT_REPO_URI="https://github.com/ozmartian/vidcutter"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-python/PyQt5
	virtual/ffmpeg
	media-video/mpv
"
RDEPEND="${DEPEND}"
