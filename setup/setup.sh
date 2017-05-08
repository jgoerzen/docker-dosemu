#!/bin/bash

set -e
set -x

# Convenience aliases
cd /usr/local/bin
ln -s /usr/bin/vim.tiny vim
ln -s /usr/bin/vim.tiny vi

for DRIVE in d e f g h i j k; do
  mkdir -p /dos/drives/$DRIVE
done

mkdir /dos/sessions


