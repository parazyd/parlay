#!/bin/sh

find . -type f -name '*.ebuild' | while read ebuild; do
	sed -e "s/^# Copyright .*/# Copyright 1999-$(date +%Y) Gentoo Authors/" \
		-i "$ebuild"
done
