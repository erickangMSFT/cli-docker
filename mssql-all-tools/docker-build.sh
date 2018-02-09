#!/bin/sh
docker build . --rm -t microsoft/sqltools:all-latest
docker rmi -f $(docker images -f "dangling=true" -q)