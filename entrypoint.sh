#!/bin/bash
set -Eeuxo pipefail
cd $GITHUB_WORKSPACE
rustup default 1.74.0-x86_64-unknown-linux-musl
rustup target add x86_64-unknown-linux-musl
bash -c "$*"
