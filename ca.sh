mkdir ./ca
openssl genrsa -out ca/ca.key 4096
openssl req -new -x509 -days 99999 -key ca/ca.key -out ca/ca.crt -config ca.cnf


