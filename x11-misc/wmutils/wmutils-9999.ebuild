# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
EGIT_REPO_URI="https://github.com/wmutils/core"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libwm"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e 's:^MANPREFIX.*:MANPREFIX = $(PREFIX)/share/man:' -i config.mk
	mv wtf.c twf.c
	mv man/wtf.1 man/twf.1
	sed -e 's:wtf\.c:twf\.c:' -i Makefile
	sed -e 's:wtf\.1:twf\.1:' -i man/Makefile
}
