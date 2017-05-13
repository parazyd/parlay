# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils git-r3

DESCRIPTION="transcode audio files and create torrents for them"
HOMEPAGE="https://github.com/RecursiveForest/whatmp3"
EGIT_REPO_URI="https://github.com/RecursiveForest/whatmp3.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE=""

DEPEND="
	media-libs/flac
	media-sound/lame
	net-p2p/mktorrent
"
RDEPEND="${DEPEND}"

src_install() {
	dobin whatmp3
	doman whatmp3.1
	dodoc README.md CHANGELOG
}
