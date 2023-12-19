#!/bin/bash

# Create a CA key (AES-256 encrypted)
openssl genrsa -aes256 -out ca-key.pem 4096

# Generate a public CA certificate
openssl req -new -x509 -sha256 -days 365 -key ca-key.pem -out ca.pem


echo "CA initialization completed."
