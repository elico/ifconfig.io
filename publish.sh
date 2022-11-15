#!/usr/bin/env bash

set -x

name="ifconfig.io"

docker buildx build -t "elicro/${name}:latest" --platform linux/amd64,linux/arm64,linux/arm/v7 --push .

set +x
