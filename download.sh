#!/bin/bash

set -e
set -x

cd /tmp/setup
wget https://www.lazybrowndog.net/freedos/virtualbox/downloads/vhd/FreeDOS1.2net.vhd.zip

# parted 3.x dropped resize command.
wget http://http.us.debian.org/debian/pool/main/p/parted/parted_2.3-12_amd64.deb
wget http://http.us.debian.org/debian/pool/main/p/parted/libparted0debian1_2.3-12_amd64.deb

sha256sum -c < sums

