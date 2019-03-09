#!/usr/bin/env bash

VERSION=0.23.1
PLATFORM=darwin
FILENAME=bazel-${VERSION:?}-installer-${PLATFORM:?}-x86_64.sh
URL=https://github.com/bazelbuild/bazel/releases/download/${VERSION:?}/${FILENAME:?}

curl -L ${URL:?} -O
chmod +x ${FILENAME:?}
sudo ./${FILENAME:?}
rm ${FILENAME:?}
