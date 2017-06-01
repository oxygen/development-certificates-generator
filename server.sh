mkdir ./csr
mkdir ./server
mkdir ./db

openssl genrsa -out server/private.pem 4096
openssl rsa -in server/private.pem -pubout -out server/public.pem
openssl req -new -sha256 -key server/private.pem -out csr/server.csr -config server.cnf
rm -f db/index.txt
rm -f db/serial.txt
touch db/index.txt
echo '01' > db/serial.txt
openssl ca -config ca.cnf -policy signing_policy -extensions v3_req -out server/server.crt -infiles csr/server.csr
