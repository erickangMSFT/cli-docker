#!/bin/sh
docker build . --rm -t microsoft/mssql-all-tools:latest
docker rmi -f $(docker images -f "dangling=true" -q)