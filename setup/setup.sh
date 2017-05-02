#!/bin/bash

set -e
set -x

cd /tmp/setup
tar -zxf unfs3-0.9.22.tar.gz
cd unfs3-0.9.22
./configure
make
make install

mkdir -p /dos/drive_{d,e,f,g,y}
mkdir /dos/drive_y/SCRIPTS

cd /tmp/setup
zcat freedos-c.qcow2.gz > /dos/freedos-c.qcow2

# Convenience aliases
cd /usr/local/bin
ln -s /usr/bin/vim.tiny vim
ln -s /usr/bin/vim.tiny vi

