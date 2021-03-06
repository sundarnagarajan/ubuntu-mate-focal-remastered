#!/bin/bash
# Override console-setup.service to fix tty1 after console-setup is run

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

SOURCE_FILE=${PROG_DIR}/../systemd/fix_tty1_font.service
DEST_DIR=/etc/systemd/system

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file not found: $SOURCE_FILE"
    exit 1
fi

echo "Copying $SOURCE_FILE to $DEST_DIR"
\cp -f "$SOURCE_FILE" "$DEST_DIR"/
systemctl enable fix_tty1_font.service
exit $?
