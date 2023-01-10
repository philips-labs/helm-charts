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
| file://./charts/k8s-workload-registrar | k8s-workload-registrar | 0.1.0 |
| file://./charts/spiffe-csi-driver | spiffe-csi-driver | 0.1.0 |
| file://./charts/spiffe-oidc-discovery-provider | spiffe-oidc-discovery-provider | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| k8s-workload-registrar.clusterName | string | `"example-cluster"` |  |
| k8s-workload-registrar.enabled | bool | `true` |  |
| k8s-workload-registrar.fullNameOverride | string | `"k8s-workload-registrar"` |  |
| k8s-workload-registrar.server.socketPath | string | `"/run/spire/server-sockets/spire-server.sock"` |  |
| k8s-workload-registrar.trustDomain | string | `"example.org"` |  |
| nameOverride | string | `""` |  |
| spiffe-csi-driver.agentSocketPath | string | `"/run/spire/agent-sockets/spire-agent.sock"` |  |
| spiffe-csi-driver.fullNameOverride | string | `"spiffe-csi-driver"` |  |
| spiffe-oidc-discovery-provider.enabled | bool | `false` |  |
| spiffe-oidc-discovery-provider.fullNameOverride | string | `"spiffe-oidc-discovery-provider"` |  |
| spiffe-oidc-discovery-provider.trustDomain | string | `"example.org"` |  |
| spire-agent.bundleConfigMap | string | `"spire-bundle"` |  |
| spire-agent.clusterName | string | `"example-cluster"` |  |
| spire-agent.nameOverride | string | `"agent"` |  |
| spire-agent.socketPath | string | `"/run/spire/agent-sockets/spire-agent.sock"` |  |
| spire-agent.trustDomain | string | `"example.org"` |  |
| spire-server.bundleConfigMap | string | `"spire-bundle"` |  |
| spire-server.clusterName | string | `"example-cluster"` |  |
| spire-server.nameOverride | string | `"server"` |  |
| spire-server.socketPath | string | `"/run/spire/server-sockets/spire-server.sock"` |  |
| spire-server.trustDomain | string | `"example.org"` |  |
