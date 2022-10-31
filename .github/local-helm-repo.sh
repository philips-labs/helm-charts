#!/usr/bin/env bash

set -euo pipefail

SCRIPTPATH=$(dirname "$0")

function install_chartmuseum {
  curl https://raw.githubusercontent.com/helm/chartmuseum/main/scripts/get-chartmuseum | bash
}

if [ ! -f "/usr/local/bin/chartmuseum" ] ; then
  install_chartmuseum
else
  echo "Using '$(/usr/bin/chartmuseum --version)'"
fi

chartmuseum --debug --port=8879 \
  --storage="local" \
  --storage-local-rootdir="./chartmuseum" &

sleep 1

helm repo add philips-labs http://127.0.0.1:8879

for chart in $(ls -d charts/* | grep -v dctna); do
  helm package -u "$chart"
  chart_package=$(ls -f | grep "${chart#*/}")
  curl --data-binary "@$chart_package" http://localhost:8879/api/charts
  rm -rf "$chart_package"
done
