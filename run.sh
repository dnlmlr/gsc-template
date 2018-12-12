#!/bin/bash

INITIAL=0

if [ -d "$TEMP_DIR" ]; then
  echo "Completing previous update, please wait..."
  cp -r $TEMP_DIR/* $SERVER_DIR/
  rm -rf $TEMP_DIR
  echo "Update completed, launching server..."
fi

if [ ! -f "$SERVER_DIR/$SERVER_EXECUTABLE" ]; then
  echo "No installation found."
  echo "Performing initial installation now..."
  
  INITIAL=1
   
  if update $INITIAL; then
    echo "Initial installation finished, launching server..."
  else
    echo "Installation failed. Exiting now..."
    exit 1
  fi
fi


source /usr/bin/preset_functions.sh
if on_run $INITIAL; then
 exit 0
else
  echo "Server program failed..."
  exit 1
fi
