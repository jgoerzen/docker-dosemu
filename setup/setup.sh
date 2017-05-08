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

mkdir /dos/sessions


