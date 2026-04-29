#!/usr/bin/env bash
# Test DES multi-block with padding
set -euo pipefail

# Build the program
g++ -std=c++17 des.cpp -o des

# Test data: 128-bit plaintext (2 blocks)
plaintext="00010010001101000101011001111000100110101011110011011110111100010001001100110100010101110111100110011011101111001101111111110001"
key="0001001100110100010101110111100110011011101111001101111111110001"

# Encrypt
ciphertext=$(echo -e "1\n$plaintext\n$key" | ./des)

# Decrypt
decrypted=$(echo -e "2\n$ciphertext\n$key" | ./des)

# Check if decrypted matches original plaintext (should be padded back, but since zero padding, it may have extra zeros, but for test, assume exact match)
if [ "$decrypted" = "$plaintext" ]; then
    echo "Multi-block test passed"
else
    echo "Multi-block test failed: expected $plaintext, got $decrypted"
    exit 1
fi
