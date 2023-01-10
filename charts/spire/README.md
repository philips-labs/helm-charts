# spire

<!-- This README.md is generated. -->

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.3](https://img.shields.io/badge/AppVersion-1.5.3-informational?style=flat-square)

A Helm chart for deploying spire-server and spire-agent.

> :warning: Please note this chart requires Projected Service Account Tokens which has to be enabled on your k8s api server.

> :warning: Minimum Spire version is `v1.0.2`.

To enable Projected Service Account Tokens on Docker for Mac/Windows run the following
command to SSH into the Docker Desktop K8s VM.

```bash
docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
```

Then add the following to `/etc/kubernetes/manifests/kube-apiserver.yaml`

```yaml
spec:
  containers:
    - command:
        - kube-apiserver
        - --api-audiences=api,spire-server
        - --service-account-issuer=api,spire-agent
        - --service-account-key-file=/run/config/pki/sa.pub
        - --service-account-signing-key-file=/run/config/pki/sa.key
```

**Homepage:** <https://github.com/philips-labs/helm-charts/charts/spire>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| marcofranssen | <marco.franssen@philips.com> | <https://marcofranssen.nl> |

## Source Code

* <https://github.com/philips-labs/helm-charts/charts/spire>

## Requirements

Kubernetes: `>=1.21.0-0`

| Repository | Name | Version |
|------------|------|---------|
| file://./charts/spiffe-csi-driver | spiffe-csi-driver | 0.1.0 |
| file://./charts/spiffe-oidc-discovery-provider | spiffe-oidc-discovery-provider | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| agent.config.logLevel | string | `"info"` |  |
| agent.config.socketPath | string | `"/run/spire/agent-sockets/spire-agent.sock"` |  |
| agent.image.pullPolicy | string | `"IfNotPresent"` |  |
| agent.image.registry | string | `"ghcr.io"` |  |
| agent.image.repository | string | `"spiffe/spire-agent"` |  |
| agent.image.version | string | `""` |  |
| agent.nodeSelector."kubernetes.io/arch" | string | `"amd64"` |  |
| agent.resources | object | `{}` |  |
| agent.service.annotations | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| server.config.ca_subject.common_name | string | `"example.org"` |  |
| server.config.ca_subject.country | string | `"NL"` |  |
| server.config.ca_subject.organization | string | `"Example"` |  |
| server.config.jwtIssuer | string | `"oidc-discovery.example.org"` |  |
| server.config.logLevel | string | `"info"` |  |
| server.config.socketPath | string | `"/run/spire/server-sockets/spire-server.sock"` |  |
| server.config.upstreamAuthority.disk.enabled | bool | `false` |  |
| server.config.upstreamAuthority.disk.secret.create | bool | `true` | If disabled requires you to create a secret with the given keys (certificate, key and optional bundle) yourself. |
| server.config.upstreamAuthority.disk.secret.data | object | `{"bundle":"","certificate":"","key":""}` | If secret creation is enabled, will create a secret with following certificate info |
| server.config.upstreamAuthority.disk.secret.name | string | `"spiffe-upstream-ca"` | If secret creation is disabled, the secret with this name will be used. |
| server.dataStorage.accessMode | string | `"ReadWriteOnce"` |  |
| server.dataStorage.enabled | bool | `true` |  |
| server.dataStorage.size | string | `"1Gi"` |  |
| server.dataStorage.storageClass | string | `nil` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"spiffe/spire-server"` |  |
| server.image.version | string | `""` |  |
| server.nodeSelector."kubernetes.io/arch" | string | `"amd64"` |  |
| server.podAnnotations | object | `{}` |  |
| server.podSecurityContext | object | `{}` |  |
| server.replicaCount | int | `1` |  |
| server.resources | object | `{}` |  |
| server.securityContext | object | `{}` |  |
| server.service.annotations | object | `{}` |  |
| server.service.port | int | `8081` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.topologySpreadConstraints | list | `[]` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| spiffe-oidc-discovery-provider.enabled | bool | `false` |  |
| spire.clusterName | string | `"example-cluster"` |  |
| spire.trustDomain | string | `"example.org"` |  |
| waitForIt.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitForIt.image.registry | string | `"cgr.dev"` |  |
| waitForIt.image.repository | string | `"chainguard/wait-for-it"` |  |
| waitForIt.image.version | string | `"latest-20221223"` |  |
| waitForIt.resources | object | `{}` |  |
| workloadRegistrar.image.pullPolicy | string | `"IfNotPresent"` |  |
| workloadRegistrar.image.registry | string | `"gcr.io"` |  |
| workloadRegistrar.image.repository | string | `"spiffe-io/k8s-workload-registrar"` |  |
| workloadRegistrar.image.version | string | `""` |  |
| workloadRegistrar.resources | object | `{}` |  |
| workloadRegistrar.service.annotations | object | `{}` |  |
