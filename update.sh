#!/bin/bash

INSTALL_DIR=$SERVER_DIR

if pgrep $SERVER_EXECUTABLE &>/dev/null; then
  INSTALL_DIR=$TEMP_DIR
  echo "Server is currently running. Using temporary directory for download: $TEMP_DIR"
  echo "Please restart the server after the update is complete to finish the installation"
fi

# PERFORM INSTALLATION INTO $INSTALL_DIR
# APPID=0
# steamcmd +login anonymous +force_install_dir $INSTALL_DIR +app_update $APPID validate +quit

exit 0
