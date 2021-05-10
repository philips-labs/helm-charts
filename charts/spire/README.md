# spire

<!-- This README.md is generated. -->

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.12.2](https://img.shields.io/badge/AppVersion-0.12.2-informational?style=flat-square)

A Helm chart for deploying spire-server and spire-agent.

**Homepage:** <https://github.com/philips-labs/helm-charts/charts/spire>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| marcofranssen | marco.franssen@philips.com | https://marcofranssen.nl |

## Source Code

* <https://github.com/philips-labs/helm-charts/charts/spire>

## Requirements

Kubernetes: `>=1.19.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| agent.image.pullPolicy | string | `"IfNotPresent"` |  |
| agent.image.repository | string | `"gcr.io/spiffe-io/spire-agent"` |  |
| agent.image.tag | string | `""` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| server.dataStorage.accessMode | string | `"ReadWriteOnce"` |  |
| server.dataStorage.enabled | bool | `true` |  |
| server.dataStorage.size | string | `"1Gi"` |  |
| server.dataStorage.storageClass | string | `nil` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.repository | string | `"gcr.io/spiffe-io/spire-server"` |  |
| server.image.tag | string | `""` |  |
| service.port | int | `8081` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| spire.agent.logLevel | string | `"INFO"` |  |
| spire.clusterName | string | `"example-cluster"` |  |
| spire.server.logLevel | string | `"INFO"` |  |
| spire.trustDomain | string | `"example.org"` |  |
| tolerations | list | `[]` |  |
