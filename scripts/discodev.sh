#!/bin/bash -e

git clone git://github.com/discoproject/disco.git /tmp/disco
cd tmp/disco
make
make install
