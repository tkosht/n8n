#!/usr/bin/sh

d=$(cd $(dirname $0) && pwd)
cd $d/../

mkdir -p .certs/
cd .certs/

# ルートCA用秘密鍵
openssl genrsa -out ca.key 4096
# ルートCA証明書
openssl req -new -x509 -days 3650 -key ca.key \
  -subj "/CN=MyLocalCA" -out ca.crt


openssl genrsa -out server.key 4096
openssl req -new -key server.key \
  -subj "/CN=${N8N_HOST}" \
  -addext "subjectAltName = IP:${N8N_HOST}" \
  -out server.csr

# subjectAltNameを一時ファイルに書き出す
printf "subjectAltName=IP:${N8N_HOST}" > san.cnf

openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key \
  -CAcreateserial -out server.crt -days 365 \
  -extfile san.cnf

# 使い終わったら削除
rm -f san.cnf

