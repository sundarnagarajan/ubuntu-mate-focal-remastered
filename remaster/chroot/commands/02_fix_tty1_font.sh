#!/bin/bash
# Install files related to making sound work

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

SOURCE_FILE=${PROG_DIR}/../systemd/fix_tty1_font.service
DEST_FILE=/etc/systemd/system/fix_tty1_font.service

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file not found: $SOURCE_FILE"
    exit 1
fi

\cp -fv "$SOURCE_FILE" "$DEST_FILE"
systemctl enable fix_tty1_font.service
exit $?
