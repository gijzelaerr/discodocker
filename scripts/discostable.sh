#!/bin/bash -e

cd /tmp
curl -O -L https://github.com/discoproject/disco/archive/0.5.tar.gz -O
tar zxvf 0.5.tar.gz
cd disco-0.5
make
make install

