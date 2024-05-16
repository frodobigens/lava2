#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-0bf3a328-91af-454e-9b0b-c8a7dfaa8906/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

near_data=$(curl -A UA -x http://171.22.250.182:6301 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"block","id":"HappyCuanAirdrop","params":{"finality":"final"}}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$near_data" >> "$OUTPUT_DIR/near.txt"
    
    echo "NEAR data fetched and saved to $OUTPUT_DIR/near.txt."
else
    echo "Failed to fetch NEAR data."
fi
