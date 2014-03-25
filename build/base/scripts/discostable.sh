#!/bin/bash -e

git clone https://github.com/discoproject/disco.git /disco
cd /disco
git checkout tags/0.5
make
make install

