#!/usr/bin/env bash
# Test DES encrypt/decrypt roundtrip
set -euo pipefail

# Build the program
g++ -std=c++17 des.cpp -o des

# Test data
plaintext="0001001000110100010101100111100010011010101111001101111011110001"
key="0001001100110100010101110111100110011011101111001101111111110001"

# Encrypt
ciphertext=$(echo -e "1\n$plaintext\n$key" | ./des)

# Decrypt
decrypted=$(echo -e "2\n$ciphertext\n$key" | ./des)

# Check if decrypted matches original plaintext
if [ "$decrypted" = "$plaintext" ]; then
    echo "Roundtrip test passed"
else
    echo "Roundtrip test failed: expected $plaintext, got $decrypted"
    exit 1
fi
