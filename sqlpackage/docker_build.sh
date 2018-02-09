#!/bin/sh

docker build . --rm -t microsoft/sqltools:sqlpackage
docker rmi -f $(docker images -f "dangling=true" -q)