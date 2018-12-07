#!/bin/bash

INSTALL_DIR=$SERVER_DIR

if pgrep $SERVER_EXECUTABLE &>/dev/null; then
  INSTALL_DIR=$TEMP_DIR
  echo "Server is currently running. Using temporary directory for download: $TEMP_DIR"
  echo "Please restart the server after the update is complete to finish the installation"
fi

source /usr/bin/funcs.sh

on_update

exit 0
