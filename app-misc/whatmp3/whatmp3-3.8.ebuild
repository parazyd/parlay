# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils

DESCRIPTION="transcode audio files and create torrents for them"
HOMEPAGE="https://github.com/RecursiveForest/whatmp3"
SRC_URI="https://github.com/RecursiveForest/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ~mips ppc ppc64 ~sparc x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
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
