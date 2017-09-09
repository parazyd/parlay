# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

ETYPE="sources"
K_DEBLOB_AVAILABLE="1"

inherit kernel-2
detect_version

DESCRIPTION="unofficial grsec kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="https://github.com/minipli/linux-unofficial_grsec/"
IUSE="deblob"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND=">=sys-devel/gcc-4.5"

GRSEC_DATE="20170907102433"
GRSEC_BASE_URL="https://github.com/minipli/linux-unofficial_grsec/releases/download"
GRSEC_VERS_URL="${GRSEC_BASE_URL}/v${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}-unofficial_grsec"
GRSEC_FILE="v${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}-unofficial_grsec-${GRSEC_DATE}.diff"
GRSEC_URI="${GRSEC_VERS_URL}/${GRSEC_FILE}"

SRC_URI="${KERNEL_URI} ${GRSEC_URI}"

UNIPATCH_LIST="${DISTDIR}/${GRSEC_FILE}"

pkg_postinst() {
	kernel-2_pkg_postinst

	local GRADM_COMPAT="sys-apps/gradm-3.1*"

	ewarn
	ewarn "Users of grsecurity's RBAC system must ensure they are using"
	ewarn "${GRADM_COMPAT}, which is compatible with ${PF}."
	ewarn "It is strongly recommended that the following command is issued"
	ewarn "prior to booting a ${PF} kernel for the first time:"
	ewarn
	ewarn "emerge -na =${GRADM_COMPAT}"
	ewarn
}
