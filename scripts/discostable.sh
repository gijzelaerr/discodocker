#!/bin/bash -e

cd /tmp
#curl -O -L https://github.com/discoproject/disco/archive/0.5.tar.gz -O
#tar zxvf 0.5.tar.gz
#cd disco-0.5
git clone https://github.com/discoproject/disco.git
cd disco
make
make install

