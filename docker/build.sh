#!/bin/bash

pushd $(dirname "$0")

docker build -f Dockerfile -t rocker/radian .

popd 

# Run in parent directory with
# docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) rocker/radian