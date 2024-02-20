#!/bin/bash

# Update apt
sudo apt update -y
sudo apt-get update -y

# Install Solana CLI — Adjust Solana version to the version of the network
sh -c "$(curl -sSfL https://release.solana.com/v1.18.2/install)"
export PATH="~/.local/share/solana/install/active_release/bin:$PATH"

# Set config variable
export SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=mainnet-beta,u=mainnet-beta_write,p=password"

