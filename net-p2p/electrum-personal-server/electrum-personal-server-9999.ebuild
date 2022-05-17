# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 git-r3

DESCRIPTION="Maximally lightweight electrum server for a single user"
HOMEPAGE="https://github.com/chris-belcher/electrum-personal-server/"
EGIT_REPO_URI="https://github.com/chris-belcher/electrum-personal-server"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="net-p2p/bitcoind[wallet]"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "s@share/doc/electrum-personal-server@&-${PV}@" -i setup.py
	distutils-r1_src_prepare
}

src_install() {
	default
	distutils-r1_src_install
	newconfd "contrib/electrumpersonalserver.confd" "electrum-personal-server"
	newinitd "contrib/electrumpersonalserver.initd" "electrum-personal-server"
}

pkg_postinst() {
	einfo "Example configuration has been installed in /usr/share/doc/${P}"
	einfo "Copy it to /etc/electrum-personal-server.ini and configure it."
}
