#!/bin/bash

set -e
set -x

cd /tmp/setup
wget https://www.lazybrowndog.net/freedos/virtualbox/downloads/vhd/FreeDOS1.2net.vhd.zip



sha256sum -c < sums

