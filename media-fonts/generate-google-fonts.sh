#!/bin/sh

usage() {
	echo "usage: $(basename "$0") /path/to/google-fonts-git"
	exit 1
}

[ -n "$1" ] || usage

if ! [ -d "$1/ofl" ] || ! [ -d "$1/apache" ]; then
	echo "error: Google fonts repo is missing apache/ofl directory."
	exit 1
fi

gitdir="$1"

get_pretty_name() {
	if ! [ -f "$1/METADATA.pb" ]; then
		echo "error: Missing $1/METADATA.pb"
		exit 1
	fi
	awk -F ': ' '/^name: / {print $2}' "$1/METADATA.pb" \
		| tr -d '"' | tr ' ' '+'
}

for i in "$gitdir/apache/"*/ "$gitdir/ofl/"*/; do
	font="$(basename "$i")"

	case "$i" in
	*/apache/*)
		license="Apache-2.0"
		shlicense="apache"
		;;
	*/ofl/*)
		license="OFL-1.1"
		shlicense="ofl"
		;;
	*)
		echo "Internal error"
		exit 1
		;;
	esac

	# command ls -1 ~/src/fonts/apache ~/src/fonts/ofl /usr/portage/media-fonts \
	# 	| sort > fonts.sorted
	# uniq fonts.sorted > fonts.uniq
	# diff fonts.uniq fonts.sorted | grep '^> '
	skip="andika
		cantarell
		cardo
		exo
		inconsolata
		jomolhari
		khmer
		nunito
		roboto
		signika
		viga
		vollkorn"

	# Avoid what is already in portage.
	s=0
	for j in $skip; do
		if [ "$j" = "$font" ]; then
			s=1
			break
		fi
	done
	if [ "$s" = 1 ]; then
		echo "Skipping: $shlicense/$font"
		continue
	fi

	echo "Generating: $shlicense/$font"
	mkdir -p "$font"
	cd "$font" || exit 1

	font_pretty="$(get_pretty_name $i)"

	cat <<EOF > "${font}-9999.ebuild"
# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3

DESCRIPTION="Google Fonts' $(echo "$font_pretty" | tr '+' ' ') ($font) font."
HOMEPAGE="https://fonts.google.com/specimen/$font_pretty"
EGIT_REPO_URI="https://github.com/google/fonts"

LICENSE="$license"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="\${DEPEND}"
BDEPEND=""

RESTRICT="binchecks strip"
FONT_SUFFIX="ttf"

src_install() {
	FONT_S="\$WORKDIR/\${P}/$shlicense/$font" font_src_install
}
EOF

	cat <<EOF > metadata.xml
<?xml version"1.0" encoding="UTF-8"?>
<!DOCTYPE pkgmetadata SYSTEM "http://www.gentoo.org/dtd/metadata.dtd">
<pkgmetadata>
	<maintainer type="person">
		<email>parazyd@dyne.org</email>
	</maintainer>
</pkgmetadata>
EOF

	ebuild "${font}-9999.ebuild" digest
	cd - >/dev/null
done
