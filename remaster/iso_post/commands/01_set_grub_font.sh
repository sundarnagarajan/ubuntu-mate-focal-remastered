#!/bin/bash

# grub prefix - used with grub-mkimage
GRUB_PREFIX="/boot/grub"

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}
SCRIPT_DIR=${PROG_DIR}
ISO_EXTRACT_DIR=${PROG_DIR}/../..
ISO_EXTRACT_DIR=$(readlink -e $ISO_EXTRACT_DIR)

SOURCE_DIR=$(readlink -e ${PROG_DIR}/../grub)
if [ ! -d "${SOURCE_DIR}" ]; then
    echo "Directory not found: ${SOURCE_DIR}"
    exit 1
fi
DEST_DIR="${ISO_EXTRACT_DIR}/boot/grub"

echo "Copying ${SOURCE_DIR} to ${DEST_DIR}"
\cp -f "${SOURCE_DIR}"/* "${DEST_DIR}"/
exit $?
