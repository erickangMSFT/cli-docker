#!/bin/sh

docker build . --rm -t ericskang/cli:latest

# docker rm -f cli
# docker run --name cli -d erickang/tools:mssql-cli tail -f /dev/null
# docker exec -ti cli bash

docker push ericskang/cli:latest