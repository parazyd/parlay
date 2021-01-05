#!/bin/sh

find . -type f -name '*.ebuild' | while read ebuild; do
	sed -e 's/^EAPI=./EAPI=7/' -i "$ebuild"
done
