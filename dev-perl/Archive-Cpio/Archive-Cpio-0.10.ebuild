# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MODULE_AUTHOR=PIXEL
MODULE_VERSION=0.10
inherit perl-module

DESCRIPTION="Perl extension for manipulating cpio archives"

SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ~ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	test? (
		>=dev-perl/Test-Fatal-0.10.0
	)"

SRC_TEST="do"
