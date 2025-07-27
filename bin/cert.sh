#!/usr/bin/sh

d=$(cd $(dirname $0) && pwd)
cd $d/../

mkdir -p .certs/
cd .certs/

openssl req -x509 -newkey rsa:4096 -nodes \
  -keyout key.pem -out cert.pem \
  -days 365 \
  -subj "/CN=192.168.1.11"

