#!/bin/bash

BLOCK_ENGINE_URL=https://frankfurt.mainnet.block-engine.jito.wtf
SHRED_RECEIVER_ADDR=145.40.93.84:1002
RELAYER_URL=http://frankfurt.mainnet.relayer.jito.wtf:8100

solana-validator \
  --log /root/validator.log \
  --limit-ledger-size \
  --rpc-port 8899 \
  --full-rpc-api \
  --identity /root/keys/validator-keypair.json \
  --vote-account "83h2PWFC3qjKvm9jYoYrjrqcxJqeP2trGqLSHwWQAmMp" \
  --no-wait-for-vote-to-start-leader \
  --wal-recovery-mode skip_any_corrupted_record \
  --entrypoint entrypoint.testnet.solana.com:8001 \
  --entrypoint entrypoint2.testnet.solana.com:8001 \
  --entrypoint entrypoint3.testnet.solana.com:8001 \
  --dynamic-port-range 8000-8020 \
  --tip-payment-program-pubkey T1pyyaTNZsKv2WcRAB8oVnk93mLJw2XzjtVYqCsaHqt \
  --tip-distribution-program-pubkey 4R3gSG8BpU4t19KYj8CfnbtRpnT8gtk4dvTHxVRwc2r7 \
  --merkle-root-upload-authority GZctHpWXmsZC1YHACTGGcHhYxjdRqQvTpYkb9LMvxDib \
  --commission-bps 800 \
  --relayer-url $RELAYER_URL \
  --block-engine-url $BLOCK_ENGINE_URL \
  --shred-receiver-address $SHRED_RECEIVER_ADDR

