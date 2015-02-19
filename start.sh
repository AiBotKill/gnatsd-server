#!/bin/bash

docker build -t gnatsd .
docker stop gnatsd
docker rm gnatsd
docker run -p 4222:4222 -d --name gnatsd gnatsd
