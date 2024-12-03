#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/tmp/node"
export HASH_FILE="${BASEDIR}/genesis.asc"

function setup() {
  apt-get update
  apt-get install -y --no-install-recommends openssl
  rm -vf ${HASH_FILE}
}

#
# helper to hash the genesis file for verification
#
# we'll be using SHA-2 / SHA-256 and SHA-512
# as well as SHA-3 / SHAKE128 and SHAKE256
#

setup
cd ${BASEDIR}
echo "SHA-256:" $(sha256sum ${BASEDIR}/genesis.json) > "$HASH_FILE"
echo "SHA-512:" $(sha512sum ${BASEDIR}/genesis.json) >> "$HASH_FILE"
echo "SHAKE128:" $(cat ${BASEDIR}/genesis.json | openssl dgst -shake128) >> "$HASH_FILE"
echo "SHAKE256:" $(cat ${BASEDIR}/genesis.json | openssl dgst -shake256) >> "$HASH_FILE"
