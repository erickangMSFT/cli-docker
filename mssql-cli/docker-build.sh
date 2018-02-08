#!/bin/sh
docker build . --rm -t microsoft/mssql-cli:latest
docker rmi -f $(docker images -f "dangling=true" -q)