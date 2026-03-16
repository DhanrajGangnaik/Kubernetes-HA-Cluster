# Rancher Monitoring

Rancher Monitoring provides the **core monitoring stack for the Kubernetes cluster.**

It deploys Prometheus, exporters, and supporting components.

---

# Installed Chart
```
rancher-monitoring
```
---
# Namespace
```
cattle-monitoring-system
```
---
# Components

The Rancher monitoring stack includes:

| Component | Purpose |
|----------|--------|
| Prometheus | Metrics collection |
| Grafana | Visualization |
| kube-state-metrics | Kubernetes object metrics |
| node-exporter | Node hardware metrics |
| Prometheus Operator | Manages monitoring resources |
| PushProx | Enables secure metrics scraping |

---

# Example Resources

Verify components using:
```
kubectl get pods -n cattle-monitoring-system
```

- Example output:
```
prometheus
grafana
node-exporter
kube-state-metrics
```
---
# Integration Model

The monitoring pipeline operates as follows:
```
Grafana VM
│
▼
Rancher Prometheus
│
▼
Exporters
│
▼
Kubernetes Nodes
```
---

# Design Benefits
Using Rancher Monitoring provides:

- automated monitoring deployment
- standard Prometheus stack
- simplified Kubernetes integration
- consistent metrics across clusters