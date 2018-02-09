#!/bin/sh

docker build . --rm -t microsoft/sqltools:sqlpackage-latest
docker rmi -f $(docker images -f "dangling=true" -q)