#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/tmp/node"

function setup_node() {
  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}" --overwrite

  mkdir -p ${BASEDIR}/config/gentx/
}

setup_node

xiond genesis collect-gentxs
xiond genesis validate-genesis
