# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils

DESCRIPTION="The Crypto Undertaker"
HOMEPAGE="https://www.dyne.org/software/tomb"
SRC_URI="https://files.dyne.org/${PN}/Tomb-${PV}.tar.gz"

S="${WORKDIR}/Tomb-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"
IUSE="tools"

DEPEND="
	app-shells/zsh
	sys-fs/cryptsetup
	app-admin/sudo
	app-crypt/pinentry
	app-crypt/gnupg
	tools? (
		app-crypt/steghide
		dev-libs/libgcrypt:0
	)
"

RDEPEND="${DEPEND}"

DOCS=( doc/TODO.org README.txt KNOWN_BUGS.txt ChangeLog.txt AUTHORS.txt INSTALL.txt COPYING.txt )

src_compile() {
	if use tools; then
		emake CC=$(tc-getCC) -C extras/kdf-keys/
	fi
}

src_install() {
	dobin tomb
	doman doc/tomb.1
	dodoc "${DOCS[@]}"

	if use tools; then
		dobin extras/kdf-keys/tomb-kdb-hexencode
		dobin extras/kdf-keys/tomb-kdb-pbkdf2
		dobin extras/kdf-keys/tomb-kdb-pbkdf2-gensalt
		dobin extras/kdf-keys/tomb-kdb-pbkdf2-getiter
	fi
}