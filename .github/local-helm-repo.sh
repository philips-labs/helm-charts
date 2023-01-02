#!/usr/bin/env bash

set -euo pipefail

helm repo add philips-labs http://127.0.0.1:8879

for chart in $(find charts -type f -name Chart.yaml | grep -v dctna); do
  chart_dir="$(dirname "${chart}")"
  package_output=$(helm package -u "${chart_dir}")
  chart_package=${package_output#*: }
  curl --data-binary "@$chart_package" http://localhost:8879/api/charts
  rm -rf "$chart_package"
done
