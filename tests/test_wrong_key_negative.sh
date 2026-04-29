#!/usr/bin/env bash
# Test wrong key: decrypt with incorrect key
set -euo pipefail

# Build the program
g++ -std=c++17 des.cpp -o des

# Test data
plaintext="0001001000110100010101100111100010011010101111001101111011110001"
key="0001001100110100010101110111100110011011101111001101111111110001"
wrong_key="0001001100110100010101110111100110011011101111001101111111110000"  # flip last bit

# Encrypt with correct key
ciphertext=$(echo -e "1\n$plaintext\n$key" | ./des)

# Decrypt with wrong key
decrypted=$(echo -e "2\n$ciphertext\n$wrong_key" | ./des)

# Check if decrypted does NOT match original plaintext
if [ "$decrypted" != "$plaintext" ]; then
    echo "Wrong key test passed: decrypted with wrong key does not match original"
else
    echo "Wrong key test failed: decrypted with wrong key matches original"
    exit 1
fi
