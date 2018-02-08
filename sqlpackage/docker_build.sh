#!/bin/sh

docker build . --rm -t ericskang/tools:sqlpackage

docker push ericskang/tools:sqlpackage