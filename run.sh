#!/bin/bash

if [ -d "$TEMP_DIR" ]; then
  echo "Completing update, please wait..."
  cp -r $TEMP_DIR/* $SERVER_DIR/
  rm -rf $TEMP_DIR
  echo "Update completed, launching server..."
fi

if [ ! -f "$SERVER_DIR/$SERVER_EXECUTABLE" ]; then
  echo "No installation found."
  echo "Performing initial installation now..."
  
  update
  
  echo "Initial installation finished, launching server..."
fi

$SERVER_DIR/$SERVER_EXECUTABLE

exit 0
