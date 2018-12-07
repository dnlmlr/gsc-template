#!/bin/bash

# Set this to the basename of the server executable.
# This will be used to check if the server is installed
SERVER_EXECUTABLE=""

####################################################
# Default function to install steamcmd and link it #
#     ARGS: $1: username for home installation     #
####################################################
function install_steamcmd() {
  dpkg --add-architecture i386
  apt-get update
  echo steam steam/question select "I AGREE" | debconf-set-selections
  echo steam steam/license note '' | debconf-set-selections
  apt-get install -y steamcmd ca-certificates
  ln -s /usr/games/steamcmd /usr/bin/steamcmd
  if [ -n "$1" ]; then
    su - $1 -c 'ln -s /usr/games/steamcmd /home/$1/steamcmd'
    su - $1 -c 'ln -s /usr/games/steamcmd /home/$1/steamcmd.sh'
    su - $1 -c '/usr/games/steamcmd +quit'
  fi
}

#########################################################
# Default function to install/update a steamcmd program #
#     ARGS: $1: App ID, $2: Additional steamcmd args    #
#########################################################
function steamcmd_update() {
  steamcmd +login anonymous +force_install_dir $INSTALL_DIR +app_update $1 validate $2 $3 +quit
}

#####################################################
# This function is executed when building the image #
#   Use to include programs/packages in the image   #
#           !! This is executed as root !!          #
#####################################################
function on_build() {
# install_steamcmd
  echo "Installing packages"
}

################################################################
# This function is executed when an update should be performed #
#      Put the update and also initial install code here       #
################################################################
function on_update() {
  echo "Starting update"
# steamcmd_update 123456
  echo "Update finished"
}

###############################################
# This function is executed to run the server #
#        Put the server start code here       #
###############################################
function on_run() {
  echo "Game server started"
}
