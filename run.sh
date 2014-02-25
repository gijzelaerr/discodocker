#!/bin/bash -ev

docker build -t gijzelaerr/discobase build/base
docker build -t gijzelaerr/discoservice build/service
docker build -t gijzelaerr/discotest build/test

# make sure the old one is gone
docker stop discoservice || true
docker rm discoservice || true

docker run -d -p 2222:22 -p 8989:8989 -name discoservice -t -i gijzelaerr/discoservice
#docker run -t -i --link=discoservice:discoservice gijzelaerr/discotest 
