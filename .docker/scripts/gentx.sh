#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/tmp/node"

function setup_node() {
  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}" --overwrite
}

function setup_wallet() {
  set +x
  if [ -n "${MNEMONIC}" ];
  then
    (echo "${MNEMONIC}"; echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys add "${KEYNAME}" \
      --keyring-backend ${KEYRING_BACKEND} \
      --home ${BASEDIR} \
      --recover
  else
    (echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys add "${KEYNAME}" \
      --keyring-backend ${KEYRING_BACKEND} \
      --home ${BASEDIR}
  fi
  set -x
}

function gentx() {
  set +x
  export ADDRESS=$( (echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys show "${KEYNAME}" -a --keyring-backend ${KEYRING_BACKEND} --home "${BASEDIR}")
  set -x

  xiond genesis add-genesis-account "${ADDRESS}" "${GENESIS_AMOUNT}" --append --home "${BASEDIR}"

  set +x
  (echo "${KEYRING_PASSPHRASE}") | xiond genesis gentx "${KEYNAME}" "${GENESIS_AMOUNT}" \
    --chain-id "${CHAIN_ID}" \
    --keyring-backend "${KEYRING_BACKEND}" \
    --commission-max-rate "${VAL_COMMISSION_MAX_RATE}" \
    --commission-max-change-rate "${VAL_COMMISSION_MAX_CHANGE_RATE}" \
    --commission-rate "${VAL_COMMISSION_RATE}" \
    --details "${VAL_DETAILS}" \
    --identity "${VAL_IDENTITY}" \
    --moniker "${MONIKER}" \
    --note "$(xiond tendermint show-node-id)" \
    --security-contact "${VAL_SECURITY_CONTACT}" \
    --website "${VAL_WEBSITE}"
  set -x

  xiond genesis validate-genesis
}

setup_node
setup_wallet
gentx
