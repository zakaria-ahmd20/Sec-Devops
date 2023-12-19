#!/bin/bash
# The shebang line specifies the interpreter to be used for the script (bash).

echo "Enter name of cert:"
read cert
# Prompt the user to enter the name of the certificate and store it in the variable 'cert'.
openssl genrsa -out "${cert}-key.pem" 4096
# Generate an RSA private key and save it to a file with the name specified by the user.

openssl req -new -sha256 -subj "/CN=rom11.ca" -key "${cert}-key.pem" -out cert.csr
# Create a certificate signing request (CSR) with the specified subject and save it to cert.csr.

echo "Enter FQDN:"
read dns
# Prompt the user to enter the Fully Qualified Domain Name (FQDN) and store it in the variable 'dns'.
echo "subjectAltName=DNS:${dns}" >> extfile.cnf
# Append a line to extfile.cnf specifying the Subject Alternative Name (SAN) with the entered FQDN.

openssl x509 -req -sha256 -days 365 -in cert.csr -CA ca.pem -CAkey ca-key.pem -out "${cert}cert.pem" -extfile extfile.cnf
# Sign the CSR using a Certificate Authority (CA) and generate an X.509 certificate.

cat "${cert}cert.pem" > "${cert}chain.pem"
# Copy the certificate to "${cert}chain.pem".

cat ca.pem >> "${cert}chain.pem"
# Append the CA certificate to "${cert}chain.pem".

mkdir "${cert}"
# Create a directory with the name specified by the user.

mv "${cert}-key.pem" "${cert}cert.pem" "${cert}chain.pem" ./"${cert}"
# Move the private key, certificate, and chain file to the directory created earlier.
