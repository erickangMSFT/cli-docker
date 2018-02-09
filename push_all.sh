#!/bin/bash

docker tag microsoft/sqltools:all ericskang/sqltools:all
docker tag microsoft/sqltools:cli ericskang/sqltools:cli
docker tag microsoft/sqltools:scripter ericskang/sqltools:scripter
docker tag sqltools-python-base:latest ericskang/sqltools:python-base
docker images

docker push ericskang/sqltools:all
docker push ericskang/sqltools:cli
docker push ericskang/sqltools:scripter
docker push ericskang/sqltools:python-base
