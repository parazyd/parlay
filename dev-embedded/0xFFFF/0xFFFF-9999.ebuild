# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Open Free Fiasco Firmware Flasher for Maemo devices"
HOMEPAGE="https://github.com/pali/0xFFFF"
EGIT_REPO_URI="https://github.com/pali/0xFFFF"
SRC_URI="https://download.sourceforge.net/libusb/libusb-0.1.12.tar.gz"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND=""

src_unpack() {
	git-r3_src_unpack
	default
}

src_prepare() {
	default

	cd ${WORKDIR}/${P}/src || die
	sed -e 's@^CFLAGS .*@& -static@' \
		-e 's@^LIBS .*@LIBS += -L./ ./libusb.a -ldl -static@' \
		-i Makefile || die
}

src_configure() {
	cd ${WORKDIR}/libusb-0.1.12 || die

	CFLAGS="-Wno-format-truncation" \
		econf \
			--enable-static \
			--disable-shared
}

src_compile() {
	cd ${WORKDIR}/libusb-0.1.12 || die
	emake || die

	cp .libs/libusb.a ${WORKDIR}/${P}/src || die

	cd ${WORKDIR}/${P} || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install || die
	dodoc README doc/*
}
