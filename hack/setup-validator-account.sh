#!/bin/bash

# Create identity keypair for the node
solana-keygen new -o ./validator-keypair.json

# Set mainnet api endpoint
solana config set --url https://api.mainnet-beta.solana.com

# set the keypair for the validator
solana config set --keypair ./validator-keypair.json

