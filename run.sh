#!/bin/bash -e

docker build -t gijzelaerr/disco .
docker run -d -p 2222:22 -t -i gijzelaerr/disco
