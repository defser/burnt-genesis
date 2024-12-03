#!/usr/bin/env bash
set -euxo pipefail

BASEDIR="/home/xiond/.xiond"
SEED_NODE="eb029462c82b46d842a47122d860617bff627fdf@xion-testnet-1.burnt.com:11656,ade4d8bc8cbe014af6ebdf3cb7b1e9ad36f412c0@testnet-seeds.polkachu.com:22356"

sed -i.bak -E "s|^(seeds[[:space:]]+=[[:space:]]+).*$|\1\"$SEED_NODE\"|" ${BASEDIR}/config/config.toml
