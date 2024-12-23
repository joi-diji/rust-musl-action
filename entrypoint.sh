#!/bin/bash
set -Eeuxo pipefail
cd $GITHUB_WORKSPACE
rustup default 1.83.0-x86_64-unknown-linux-gnu
rustup target add x86_64-unknown-linux-musl
bash -c "$*"
