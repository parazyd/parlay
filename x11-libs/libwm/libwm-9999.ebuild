# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A small library for X window manipulation"
HOMEPAGE="https://github.com/wmutils/libwm"
EGIT_REPO_URI="https://github.com/wmutils/libwm.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

src_prepare() {
	default
	sed -e 's:/usr/local:/usr:' -i config.mk
}
