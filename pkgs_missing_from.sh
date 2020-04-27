#!/bin/bash
if [ -n "$BASH_SOURCE" ]; then
    PROG_PATH=${PROG_PATH:-$(readlink -e $BASH_SOURCE)}
else
    PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
fi
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}
SCRIPT_DIR="${PROG_DIR}"

. ${SCRIPT_DIR}/remaster_iso_functions.sh || exit 1


REQD_PPKGS_FILE=$(readlink -e $(dirname $0)/required_packages.txt)
REQD_PKGS=$(remove_comments "$REQD_PPKGS_FILE")
echo $REQD_PKGS
check_required_pkgs $REQD_PKGS
