# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Mount Android phones on Linux with adb. No root required."
HOMEPAGE="https://github.com/spion/adbfs-rootless"
EGIT_REPO_URI="https://github.com/spion/adbfs-rootless"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-util/android-tools
	sys-fs/fuse:0
"
RDEPEND="${DEPEND}"

src_compile() {
	emake CC=$(tc-getCC)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}
