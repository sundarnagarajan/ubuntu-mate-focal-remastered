#!/bin/bash
# Install files related to making sound work

PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

SOURCE_FILE=${PROG_DIR}/../console-setup/console-setup
DEST_FILE=/etc/default/console-setup

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file not found: $SOURCE_FILE"
    exit 1
fi

\cp -fv "$SOURCE_FILE" "$DEST_FILE"
exit $?
