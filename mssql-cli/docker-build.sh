#!/bin/sh

docker build . --rm -t microsoft/sqltools:cli-latest
docker rmi -f $(docker images -f "dangling=true" -q)
