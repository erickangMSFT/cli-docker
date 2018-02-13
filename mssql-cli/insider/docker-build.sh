#!/bin/sh
docker build . --rm -t microsoft/sqltools:cli-insider
docker rmi -f $(docker images -f "dangling=true" -q)

docker tag microsoft/sqltools:cli-insider ericskang/sqltools:cli-insider
docker push ericskang/sqltools:cli-insider