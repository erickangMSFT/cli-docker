#!/bin/sh

docker build ./mssql-scripter --rm -t microsoft/mssql-scripter:latest
docker rmi -f $(docker images -f "dangling=true" -q)