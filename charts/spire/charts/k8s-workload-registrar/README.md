# k8s-workload-registrar

<!-- This README.md is generated. -->

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.3](https://img.shields.io/badge/AppVersion-1.5.3-informational?style=flat-square)

A Helm chart to install the SPIRE k8s workload registrator.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `5` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| clusterName | string | `"example-cluster"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"gcr.io"` |  |
| image.repository | string | `"spiffe-io/k8s-workload-registrar"` |  |
| image.version | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| logLevel | string | `"info"` |  |
| nameOverride | string | `""` |  |
| nodeSelector."kubernetes.io/arch" | string | `"amd64"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| server.host | string | `"spire-server"` |  |
| server.port | int | `8081` |  |
| server.socketPath | string | `"/run/spire/server-sockets/spire-server.sock"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| trustDomain | string | `"example.org"` |  |
| waitForIt.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitForIt.image.registry | string | `"cgr.dev"` |  |
| waitForIt.image.repository | string | `"chainguard/wait-for-it"` |  |
| waitForIt.image.version | string | `"latest-20221215"` |  |
| waitForIt.resources | object | `{}` |  |
