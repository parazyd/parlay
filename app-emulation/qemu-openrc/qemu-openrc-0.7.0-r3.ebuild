# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user

DESCRIPTION="OpenRC init script for QEMU/KVM"
HOMEPAGE="https://github.com/jirutka/qemu-openrc"

SRC_URI="https://github.com/jirutka/${PN}/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64 ~x86"

RDEPEND="
	app-emulation/qemu
	net-misc/socat"

src_install() {
	dobin qemush
	newinitd qemu.initd qemu
	newconfd qemu.confd qemu
	dodoc README.adoc
}

pkg_setup() {
	enewgroup qemu
	enewuser qemu -1 -1 /var/lib/qemu qemu,kvm
}
