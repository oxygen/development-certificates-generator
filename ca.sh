mkdir ./ca
openssl genrsa -out ca/ca.pem 4096
openssl req -new -x509 -days 99999 -key ca/ca.pem -out ca/ca.crt -config ca.cnf


