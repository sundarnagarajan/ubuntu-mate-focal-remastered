#!/bin/bash
# Override console-setup.service to fix tty1 after console-setup is run

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

SOURCE_DIR=${PROG_DIR}/../systemd
DEST_DIR=/etc/systemd/system

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source dir not found: $SOURCE_DIR"
    exit 1
fi

echo "Copying $SOURCE_DIR to $DEST_DIR"
\cp -fr "$SOURCE_DIR"/* "$DEST_DIR"/
exit $?
