#!/bin/bash

set -e
set -x

cd /tmp/setup
wget -O unfs3-0.9.22.tar.gz 'https://downloads.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz?r=http%3A%2F%2Funfs3.sourceforge.net%2F&ts=1493740467&use_mirror=superb-dca2'


sha256sum -c < sums

