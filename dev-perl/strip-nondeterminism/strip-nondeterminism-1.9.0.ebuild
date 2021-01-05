# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

SRC_URI="mirror://salsa/reproducible-builds/${PN}/-/archive/${PV}/${P}.tar.gz"
inherit perl-module

DESCRIPTION="Perl library for stripping non-deterministic information"

SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ~ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-perl/Archive-Cpio
	dev-perl/Sub-Override
	test? (
		>=dev-perl/Test-Fatal-0.10.0
	)"

SRC_TEST="do"
