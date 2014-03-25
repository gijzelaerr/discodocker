#!/bin/bash -ev

docker build -t gijzelaerr/discobase build/base
docker build -t gijzelaerr/discoservice build/service
docker build -t gijzelaerr/discotest build/test

# make sure the old one is gone
docker stop discoservice || true
docker rm discoservice || true

docker run \
    -d \
    -t \
    -p 2222:22 \
    -p 8989:8989 \
    -v `pwd`/data:/data \
    -name discoservice \
    gijzelaerr/discoservice

docker port discoservice 22
docker port discoservice 8989

#docker run -t -i --link=discoservice:discoservice gijzelaerr/discotest 
