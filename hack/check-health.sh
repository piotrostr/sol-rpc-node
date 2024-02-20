#!/bin/bash

export IP_ADDRESS=localhost
export PORT=8899

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1, "method":"getHealth"}' \
  http://$IP_ADDRESS:$PORT

curl -X POST \
  -d '{ "jsonrpc": "2.0", "id": 1, "method": "getBlockHeight", "params": []}' \
  -H "Content-Type: application/json" \
  http://$IP_ADDRESS:$PORT 
