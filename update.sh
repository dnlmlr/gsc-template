#!/bin/bash

INSTALL_DIR=$SERVER_DIR

RUNNING=0
INITIAL=$1
if [ -z "$INITIAL" ]; then
  INITIAL=0
fi

if pgrep $SERVER_EXECUTABLE &>/dev/null; then
  INSTALL_DIR=$TEMP_DIR
  echo "Server is currently running. Using temporary directory for download: $TEMP_DIR"
  echo "Please restart the server after the update is complete to finish the installation"
  RUNNING=1
fi

source /usr/bin/preset_functions.sh

if on_update $INITIAL $RUNNING $INSTALL_DIR; then
  echo "Update successful"
else
  echo "Update failed"
  exit 1
fi

exit 0
