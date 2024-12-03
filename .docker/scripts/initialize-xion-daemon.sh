#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"

function setup_node() {
  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}" --overwrite
}

setup_node
