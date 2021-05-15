# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..10} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Scripts to make the life of a Debian Package maintainer easier"
HOMEPAGE="https://salsa.debian.org/debian/devscripts"
SRC_URI="mirror://debian/pool/main/d/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

CDEPEND="
	dev-lang/perl:=
	dev-perl/File-DesktopEntry
	dev-perl/libwww-perl
	dev-util/distro-info
	${PYTHON_DEPS}
"
DEPEND="${CDEPEND}
	app-shells/bash-completion
	virtual/pkgconfig
	test? (
		dev-perl/Software-License
		dev-perl/UNIVERSAL-require
		dev-util/shunit2
		$(python_gen_cond_dep '
			dev-python/flake8[${PYTHON_MULTI_USEDEP}]
		')
	)"
RDEPEND="${CDEPEND}
	app-arch/dpkg
	app-text/wdiff
	dev-util/debhelper
	sys-apps/fakeroot
"

DISTUTILS_S="${S}"/scripts

src_prepare() {
	default

	# Replace Debian xsl stylesheets paths with Gentoo's
	sed -i \
		-e 's#stylesheet/xsl/nwalsh#xsl-stylesheets#g' \
		"${S}"/po4a/Makefile \
		"${DISTUTILS_S}"/Makefile \
		"${DISTUTILS_S}"/deb-reversion.dbk || die

	# distutils-r1 eclass will be used instead
	sed -i -e "/python3 setup.py/d" \
		-e "/python3 -m flake8/d" \
		-e "/py3versions/d" \
		"${DISTUTILS_S}"/Makefile || die

	# Avoid file collision with app-shells/bash-completion
	rm "${DISTUTILS_S}"/bts.bash_completion || die

	# It's not possible to use all Debian stuff in Gentoo.
	# Remove known failing tests for now.
	sed -i -e "s/dd-list//g" \
		-e "s/package_lifecycle//g" \
		"${S}"/test/Makefile || die
}

src_configure() {
	default

	pushd "${DISTUTILS_S}" > /dev/null || die
	distutils-r1_src_configure
	popd > /dev/null || die
}

src_compile() {
	default

	pushd "${DISTUTILS_S}" > /dev/null || die
	distutils-r1_src_compile
	popd > /dev/null || die
}

src_install() {
	dodir /usr/bin
	default

	pushd "${DISTUTILS_S}" > /dev/null || die
	distutils-r1_src_install
	popd > /dev/null || die
}

src_test() {
	default

	pushd "${DISTUTILS_S}" > /dev/null || die
	distutils-r1_src_test
	popd > /dev/null || die
}
