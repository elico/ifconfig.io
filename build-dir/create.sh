#!/usr/bin/env sh

set -x

name=${PWD##*/}
name="ifconfig.io"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags=jsoniter -o linux/amd64/"$name" main.go
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -tags=jsoniter -o linux/arm64/"$name" main.go
CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -tags=jsoniter -o linux/arm/"$name" main.go
#CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=6 go build -o linux/arm/v6/"$name" main.go

upx --best --lzma linux/amd64/"$name"
upx --best --lzma linux/arm64/"$name"
upx --best --lzma linux/arm/"$name"

set +x
