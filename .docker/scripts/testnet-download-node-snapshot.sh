#!/usr/bin/env bash
set -euxo pipefail

BASEDIR="/home/xiond/.xiond"
TAR_LZ4="https://files.xion-testnet-1.burnt.com/xion-testnet-1-latest.tar.lz4"

curl -o - -L ${TAR_LZ4} | lz4 -c -d - | tar -x -v -C ${BASEDIR}
