#!/usr/bin/env bash
# Test DES sample encryption
set -euo pipefail

# Build the program
g++ -std=c++17 des.cpp -o des

# Sample data from original code
plaintext="0001001000110100010101100111100010011010101111001101111011110001"
key="0001001100110100010101110111100110011011101111001101111111110001"
expected_ciphertext="0111111010111111010001001001001100100011111110101111101011111000"

# Encrypt
ciphertext=$(echo -e "1\n$plaintext\n$key" | ./des)

# Check if matches expected
if [ "$ciphertext" = "$expected_ciphertext" ]; then
    echo "DES sample test passed"
else
    echo "DES sample test failed: expected $expected_ciphertext, got $ciphertext"
    exit 1
fi
