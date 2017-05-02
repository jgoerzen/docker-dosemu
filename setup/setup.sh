#!/bin/bash

set -e
set -x

cd /tmp/setup
tar -zxf unfs3-0.9.22.tar.gz
cd unfs3-0.9.22
./configure
make
make install


mkdir -p /dos/drive_{c,d,e,f,g,y}
mkdir /dos/drive_y/SCRIPTS

DOSBOXCONF="`dosbox -printconf`"
mv "$DOSBOXCONF" /dos/dosbox.conf
for ASDF in c d e f g h y; do 
  echo "mount $ASDF /dos/drive_$ASDF" >> /dos/dosbox.conf
done
echo 'path %PATH%;Y:\DOS;Y:\SCRIPTS' >> /dos/dosbox.conf

# Fix an issue with the VNC console
sed -i 's/usescancodes=true/usescancodes=false/' /dos/dosbox.conf

# Convenience aliases
cd /usr/local/bin
ln -s /usr/bin/vim.tiny vim
ln -s /usr/bin/vim.tiny vi

