#!/usr/bin/env bash

cd build-dir && docker build -t local-build/ifconfig.io . && \
	docker run -it -v $(pwd):/build local-build/ifconfig.io

