#!/usr/bin/env bash
# Test tamper: flip a bit in ciphertext and check decrypt fails
set -euo pipefail

# Build the program
g++ -std=c++17 des.cpp -o des

# Test data
plaintext="0001001000110100010101100111100010011010101111001101111011110001"
key="0001001100110100010101110111100110011011101111001101111111110001"

# Encrypt
ciphertext=$(echo -e "1\n$plaintext\n$key" | ./des)

# Tamper: flip first bit
if [ "${ciphertext:0:1}" = "0" ]; then
    tampered="1${ciphertext:1}"
else
    tampered="0${ciphertext:1}"
fi

# Decrypt tampered
decrypted=$(echo -e "2\n$tampered\n$key" | ./des)

# Check if decrypted does NOT match original plaintext
if [ "$decrypted" != "$plaintext" ]; then
    echo "Tamper test passed: decrypted tampered ciphertext does not match original"
else
    echo "Tamper test failed: decrypted tampered ciphertext matches original"
    exit 1
fi
