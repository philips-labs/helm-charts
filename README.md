# Philips-labs

[![MIT License](https://img.shields.io/github/license/philips-labs/helm-charts?style=for-the-badge)](https://opensource.org/licenses/MIT)

This repository hosts philips-labs [Helm](https://helm.sh) charts.

## Add Helm repository

```bash
helm repo add philips-labs https://philips-labs.github.io/helm-charts/
helm repo update
```

## Add more charts to this repository

Add your helm repository as a submodule to this repository.

e.g.

```bash
git submodule add git@github.com:philips-labs/dctna-helm.git charts/dctna
```

Also ensure to add your chart to the dependabot config so it will automatically create PRs for updates to your chart.

e.g.

```yml
  - package-ecosystem: "gitsubmodule"
    directory: "/charts/dctna"
    schedule:
      interval: "daily"
```
