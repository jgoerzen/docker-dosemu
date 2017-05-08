#!/bin/bash

set -e
set -x

# Convenience aliases
cd /usr/local/bin
ln -s /usr/bin/vim.tiny vim
ln -s /usr/bin/vim.tiny vi

for DRIVE in e f g h i j k; do
  mkdir -p /dos/drive_$DRIVE
  ln -s /dos/drive_$DRIVE /etc/dosemu/drives/$DRIVE
done

touch /dos/drive_e/BOOTUP.BAT

mkdir /dos/sessions
mkdir /dos/session.skel

# These seem to be what dosemu does on start.
#cp -rv /etc/dosemu/freedos /dos/session.skel/drive_c
#mkdir /dos/session.skel/drive_c/tmp

touch /dos/session.skel/dosemu.conf

