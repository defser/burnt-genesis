#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/tmp/node"

function setup_node() {
  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}" --overwrite
}

setup_node
xiond genesis add-genesis-account "${ADDRESS}" "${GENESIS_AMOUNT}" --append --home "${BASEDIR}"
