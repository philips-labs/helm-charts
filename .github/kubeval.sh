#!/usr/bin/env bash

set -euo pipefail

SCRIPTPATH=$(dirname "$0")
KUBEVAL_VERSION="0.15.0"

function install_kubeval {
  case "$(uname -s)" in
    Linux*)
      machine=linux
      shasum=sha256sum
      ;;
    Darwin*)
      machine=darwin
      shasum=shasum
      ;;
    esac

    curl -LO https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-${machine}-amd64.tar.gz
    curl -L --output /tmp/checksums_kubeval.txt https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/checksums.txt
    cat /tmp/checksums_kubeval.txt | grep kubeval-${machine}-amd64.tar.gz | $shasum -c -
    mkdir -p $SCRIPTPATH/bin
    tar -xf kubeval-${machine}-amd64.tar.gz kubeval
    mv kubeval $SCRIPTPATH/bin/
    rm kubeval-${machine}-amd64.tar.gz
}

if [ ! -f "$SCRIPTPATH/bin/kubeval" ] ; then
  install_kubeval
elif [[ ! "$($SCRIPTPATH/bin/kubeval --version)" =~ .*"$KUBEVAL_VERSION".* ]] ; then
  install_kubeval
else
  echo "Using '$($SCRIPTPATH/bin/kubeval --version)'"
fi

SCHEMA_LOCATION="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"

for chart in $(ls -d charts/* | grep -v dctna) ; do
  helm template $chart | $SCRIPTPATH/bin/kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done
