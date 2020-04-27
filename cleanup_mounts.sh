#!/bin/bash
if [ -n "$BASH_SOURCE" ]; then
    PROG_PATH=${PROG_PATH:-$(readlink -e $BASH_SOURCE)}
else
    PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
fi
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}
SCRIPT_DIR="${PROG_DIR}"

function setvars() {
    START_TIME=$(date)
    export TOP_DIR=$(readlink -e $(dirname $0))
    export R_DIR=${TOP_DIR}/ubuntu-mate-focal-remastered/remaster
    export INPUT_ISO=${TOP_DIR}/ISO/in/source.iso
    export EXTRACT_DIR=${TOP_DIR}/ISO/extract
    export OUTPUT_ISO=${TOP_DIR}/ISO/out/modified.iso
}

setvars

function cleanup_mounts()
{
    if [ -z "$EXTRACT_DIR" ]; then
        return
    fi
    which findmnt 1>/dev/null 2>&1 || return
    for d in $(findmnt -n -l | grep "$EXTRACT_DIR" | awk '{print $1}' | sort -r)
    do
        echo "Unmounting $d"
        umount $d
    done
    rm -rf "$EXTRACT_DIR"
}

# ------------------------------------------------------------------------
# Main script starts after this
# ------------------------------------------------------------------------

cleanup_mounts
