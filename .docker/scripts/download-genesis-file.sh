#!/usr/bin/env bash
set -euxo pipefail

BASEDIR="/home/xiond/.xiond"
GENESIS_JSON="https://files.xion-testnet-1.burnt.com/genesis.json"

curl ${GENESIS_JSON} -o ${BASEDIR}/config/genesis.json -s
