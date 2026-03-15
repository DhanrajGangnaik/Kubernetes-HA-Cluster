## Current Deployment Model

Grafana is self-hosted on a separate VM.

## Datasources

- infrastructure Prometheus
- Rancher Kubernetes Prometheus

## Initial Validation Queries

```text
up
node_uname_info
kube_node_info