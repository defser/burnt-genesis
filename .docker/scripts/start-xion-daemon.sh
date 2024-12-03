#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"

function start_node() {
  xiond start --x-crisis-skip-assert-invariants --home "${BASEDIR}"
}

start_node
