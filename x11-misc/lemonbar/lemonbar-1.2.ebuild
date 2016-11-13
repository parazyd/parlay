# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"
SRC_URI="https://github.com/LemonBoy/bar/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/bar-${PV}"
