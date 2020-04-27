#!/bin/bash
# Override console-setup.service to fix tty1 after console-setup is run

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

SOURCE_DIR=${PROG_DIR}/../systemd
DEST_DIR=/etc/systemd/system

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file not found: $SOURCE_FILE"
    exit 1
fi

\cp -frv "$SOURCE_DIR"/* "$DEST_DIR"/
exit $?
