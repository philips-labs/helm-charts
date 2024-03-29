# spire-server

<!-- This README.md is generated. -->

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square)

A Helm chart to install the SPIRE server.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bundleConfigMap | string | `"spire-server"` |  |
| ca_subject.common_name | string | `"example.org"` |  |
| ca_subject.country | string | `"NL"` |  |
| ca_subject.organization | string | `"Example"` |  |
| clusterName | string | `"example-cluster"` |  |
| controllerManager.enabled | bool | `true` |  |
| controllerManager.identities.dnsNameTemplates | list | `[]` |  |
| controllerManager.identities.enabled | bool | `true` |  |
| controllerManager.identities.namespaceSelector | object | `{}` |  |
| controllerManager.identities.podSelector | object | `{}` |  |
| controllerManager.identities.spiffeIDTemplate | string | `"spiffe://{{ .TrustDomain }}/ns/{{ .PodMeta.Namespace }}/sa/{{ .PodSpec.ServiceAccountName }}"` |  |
| controllerManager.ignoreNamespaces[0] | string | `"kube-system"` |  |
| controllerManager.ignoreNamespaces[1] | string | `"kube-public"` |  |
| controllerManager.ignoreNamespaces[2] | string | `"local-path-storage"` |  |
| controllerManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| controllerManager.image.registry | string | `"ghcr.io"` |  |
| controllerManager.image.repository | string | `"spiffe/spire-controller-manager"` |  |
| controllerManager.image.version | string | `"0.2.2"` |  |
| controllerManager.resources | object | `{}` |  |
| controllerManager.securityContext | object | `{}` |  |
| controllerManager.service.annotations | object | `{}` |  |
| controllerManager.service.port | int | `443` |  |
| controllerManager.service.type | string | `"ClusterIP"` |  |
| dataStorage.accessMode | string | `"ReadWriteOnce"` |  |
| dataStorage.enabled | bool | `true` |  |
| dataStorage.size | string | `"1Gi"` |  |
| dataStorage.storageClass | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"spiffe/spire-server"` |  |
| image.version | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| jwtIssuer | string | `"oidc-discovery.example.org"` |  |
| k8sWorkloadRegistrar.enabled | bool | `false` | The `k8s-workload-registrar` is deprecated in favor of the `spire-controller-manager` `k8s-workload-registrar` does not have a arm64 compatible build and requires you to limit to amd64 nodes. Ensure to set an appropiate nodeSelector. |
| k8sWorkloadRegistrar.image.pullPolicy | string | `"IfNotPresent"` |  |
| k8sWorkloadRegistrar.image.registry | string | `"gcr.io"` |  |
| k8sWorkloadRegistrar.image.repository | string | `"spiffe-io/k8s-workload-registrar"` |  |
| k8sWorkloadRegistrar.image.version | string | `"1.5.5"` |  |
| k8sWorkloadRegistrar.logLevel | string | `"info"` |  |
| k8sWorkloadRegistrar.resources | object | `{}` |  |
| k8sWorkloadRegistrar.securityContext | object | `{}` |  |
| logLevel | string | `"info"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | SPIRE server currently runs with a sqlite database. Scaling to multiple instances will not work until we use an external database. |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8081` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| socketPath | string | `"/run/spire/server-sockets/spire-server.sock"` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| trustDomain | string | `"example.org"` |  |
| upstreamAuthority.disk.enabled | bool | `false` |  |
| upstreamAuthority.disk.secret.create | bool | `true` | If disabled requires you to create a secret with the given keys (certificate, key and optional bundle) yourself. |
| upstreamAuthority.disk.secret.data | object | `{"bundle":"","certificate":"","key":""}` | If secret creation is enabled, will create a secret with following certificate info |
| upstreamAuthority.disk.secret.name | string | `"spiffe-upstream-ca"` | If secret creation is disabled, the secret with this name will be used. |
