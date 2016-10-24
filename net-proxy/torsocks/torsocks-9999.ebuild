# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils multilib versionator git-r3

MY_PV="$(replace_version_separator 3 -)"
MY_PF="${PN}-${MY_PV}"
S=${WORKDIR}/${MY_PF}

DESCRIPTION="Use most socks-friendly applications with Tor"
HOMEPAGE="https://gitweb.torproject.org/torsocks.git"
EGIT_REPO_URI="https://git.torproject.org/torsocks.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

# We do not depend on tor which might be running on a different box
DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "/dist_doc_DATA/s/^/#/" Makefile.am doc/Makefile.am || die

	# Disable tests requiring network access.
	#sed -i -e '/^\.\/test_dns$/d' tests/test_list || \
	#	die "failed to disable network tests"

	eautoreconf
}

src_configure() {
	#epatch "${FILESDIR}/musl-fix.patch"
	econf $(use_enable static-libs static)
}

src_install() {
	default

	dodoc ChangeLog README.md doc/notes/DEBUG doc/socks/{SOCKS5,socks-extensions.txt}

	#Remove libtool .la files
	cd "${D}"/usr/$(get_libdir)/torsocks || die
	rm -f *.la
}
