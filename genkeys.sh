mkdir /Certificates
mkdir /Certificates/ca
mkdir /Certificates/csr
mkdir /Certificates/server
mkdir /Certificates/db
cd /Certificates
openssl genrsa -out ca/ca.key 4096
openssl genrsa -out server/server.key 4096
openssl req -new -x509 -days 99999 -key ca/ca.key -out ca/ca.crt -config ca.cnf
openssl req -new -sha256 -key server/server.key -out csr/server.csr -config server.cnf
rm -f db/index.txt
rm -f db/serial.txt
touch db/index.txt
echo '01' > db/serial.txt
openssl ca -config ca.cnf -policy signing_policy -extensions v3_req -out server/server.crt -infiles csr/server.csr


# CentOS
# cp ca/ca.crt /etc/pki/ca-trust/source/anchors/
# update-ca-trust

# Debian, Ubuntu
# cp ca/ca.crt /usr/local/share/ca-certificates/ca.crt
# update-ca-certificates
# Remove: update-ca-certificates --fresh

# Windows
# certutil -addstore -f "ROOT" ca/ca.crt

# Firefox (has its own store)
# Options (Settings) / Advanced / Certificates / See certificates / Import - Authorize for websites.
