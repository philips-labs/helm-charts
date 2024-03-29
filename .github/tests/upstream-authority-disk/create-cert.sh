#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

openssl req -new -x509 -days 365 -nodes -sha256 \
  -subj "/C=NL/O=Philips/OU=HSP/CN=example.org" \
  -out "${BASEDIR}/example-org.pem" \
  -keyout "${BASEDIR}/example-org.key"
