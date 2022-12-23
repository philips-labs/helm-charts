#!/usr/bin/env bash

set -euo pipefail

chartmuseum --debug --port=8879 \
  --storage="local" \
  --storage-local-rootdir="./chartmuseum" &

sleep 1

helm repo add philips-labs http://127.0.0.1:8879

for chart in $(find charts -maxdepth 1 -type d | grep -v dctna); do
  helm package -u "$chart"
  chart_package=$(find charts -maxdepth 1 -type f | grep "${chart}")
  curl --data-binary "@$chart_package" http://localhost:8879/api/charts
  rm -rf "$chart_package"
done
