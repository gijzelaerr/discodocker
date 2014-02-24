#!/bin/bash -e

git clone git://github.com/discoproject/disco.git /disco
cd /disco
make
make install
