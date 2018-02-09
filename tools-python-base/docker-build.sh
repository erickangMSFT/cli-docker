#!/bin/sh
docker build . --rm -t sqltools-python-base:latest
docker rmi -f $(docker images -f "dangling=true" -q)