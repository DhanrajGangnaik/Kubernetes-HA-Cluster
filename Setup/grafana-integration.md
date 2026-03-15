# Grafana Integration

## Goal

Use the existing external Grafana VM instead of relying on in-cluster Grafana.

## Steps Performed

1. exposed Rancher Prometheus via NodePort
2. routed it through edge NGINX
3. added DNS record `prometheus-k8s.homelab.internal`
4. added the endpoint as a Prometheus datasource in external Grafana

## Result

Grafana successfully queried Kubernetes metrics such as:

```text
node_uname_info
kube_node_info
up