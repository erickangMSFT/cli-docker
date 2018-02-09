#!/bin/sh

docker build ./mssql-scripter --rm -t microsoft/sqltools:scripter-latest
docker rmi -f $(docker images -f "dangling=true" -q)