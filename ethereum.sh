#!/bin/bash

RPC_URL="https://eth1.lava.build/lava-referer-0bf3a328-91af-454e-9b0b-c8a7dfaa8906/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

eth_data=$(curl -A UA -x http://171.22.250.182:6301 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
