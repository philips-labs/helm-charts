#!/bin/bash
set -eu

svc="$1"
ns="$2"

csrName="${svc}.${ns}.svc.cluster.local"
tmpdir=$(mktemp -d)
echo "creating certs in tmpdir ${tmpdir} "

cat <<EOF >> "${tmpdir}"/csr.conf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[v3_req]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = ${svc}
DNS.2 = ${csrName}
DNS.3 = ${csrName}.svc
EOF

openssl genrsa -out "${tmpdir}"/server-key.pem 2048
openssl req -new -key "${tmpdir}"/server-key.pem \
  -subj "/CN=${csrName}.svc" -out "${tmpdir}"/server.csr \
  -config "${tmpdir}"/csr.conf

# clean-up any previously created CSR for our service. Ignore errors if not present.
kubectl delete csr "${csrName}" 2>/dev/null || true

# create server cert/key CSR and send to k8s API
cat <<EOF | kubectl create -f -
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: ${csrName}
spec:
  groups:
  - system:authenticated
  request: $(base64 "${tmpdir}"/server.csr | tr -d '\n')
  usages:
  - digital signature
  - key encipherment
  - server auth
EOF

# verify CSR has been created
while true; do
    if kubectl get csr "${csrName}"; then
        break
    fi
done

# approve and fetch the signed certificate
kubectl certificate approve "${csrName}"
# verify certificate has been signed
for x in $(seq 10); do
    serverCert=$(kubectl get csr "${csrName}" -o jsonpath='{.status.certificate}')
    if [[ ${serverCert} != '' ]]; then
        break
    fi
    sleep 1
done
if [[ ${serverCert} == '' ]]; then
    echo "ERROR: After approving csr ${csrName}, the signed certificate did not appear on the resource. Giving up after 10 attempts." >&2
    exit 1
fi
echo "${serverCert}" | openssl base64 -d -A -out "${tmpdir}"/server-cert.pem


# create the secret with CA cert and server cert/key
kubectl create secret generic "${csrName}"-cert \
        --from-file=key.pem="${tmpdir}"/server-key.pem \
        --from-file=cert.pem="${tmpdir}"/server-cert.pem \
        --dry-run=client -o yaml |
    kubectl -n "${ns}" apply -f -
