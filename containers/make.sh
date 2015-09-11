#!/bin/bash

# Script to build docker images from dockerfiles and fresh code

set -e
pushd $(dirname $BASH_SOURCE)
pushd ../

IMAGE=$1
if [ -z "${IMAGE}" ]; then
    echo "usage: make.sh <image> <name>"
    exit 1
fi

NAME=$2
if [ -z "${NAME}" ]; then
    echo "usage: make.sh <image> <name>"
    exit 1
fi

BASE=$(cd "$(dirname $0)" && pwd)

if [[ "${BASE}" != *marathoner/containers ]]; then
    echo "Not in the right tree, expected marathoner"
    exit 1
fi

rsync -a --delete --delete-excluded --exclude=marathoner/containers \
    "${BASE}" "${BASE}/${IMAGE}/src"

docker build -t "${NAME}" "${BASE}/${IMAGE}"

popd
popd
