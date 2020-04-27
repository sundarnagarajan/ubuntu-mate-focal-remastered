#!/bin/bash

# grub prefix - used with grub-mkimage
GRUB_PREFIX="/boot/grub"

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}
ISO_EXTRACT_DIR=${PROG_DIR}/../..
ISO_EXTRACT_DIR=$(readlink -e $ISO_EXTRACT_DIR)


SCRIPT_DIR=${PROG_DIR}

# Name of font file in GRUB_DIR
FONT_FILE=font.pf2

FONT_SOURCE_FILE="${PROG_DIR}/../grub/${FONT_FILE}"
FONT_SOURCE_FILE=$(readlink -e $FONT_SOURCE_FILE)
if [ ! -f "${FONT_SOURCE_FILE}" ]; then
    echo "Font file not found: ${FONT_SOURCE_FILE}"
    exit 1
fi
FONT_DEST_FILE="${ISO_EXTRACT_DIR}/boot/grub${FONT_FILE}"
FONT_DEST_FILE=$(readlink -e $FONT_DEST_FILE)
\cp -fv "$FONT_SOURCE_FILE" "$FONT_DEST_FILE"

ret=$?
ls -l "$FONT_DEST_FILE"
file "$FONT_DEST_FILE"
exit $?
