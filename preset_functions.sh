#!/bin/bash

function preset_install_steamcmd() {
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
