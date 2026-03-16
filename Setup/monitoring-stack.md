# Monitoring Stack Deployment

This document describes the deployment of the Kubernetes monitoring stack.

---

# Components

The monitoring stack includes:

- Prometheus
- node exporter
- kube state metrics
- alert manager

These components are installed using Rancher Monitoring.

---

# Installation Steps

Open Rancher UI

Navigate to:

```
Cluster Management
→ Apps & Marketplace
→ Charts
→ Rancher Monitoring
```

Install monitoring stack.

---

# Verify Installation

Run:

```
kubectl get pods -n cattle-monitoring-system
```

Expected output should show:

```
prometheus
grafana
alertmanager
kube-state-metrics
node-exporter
```

---

# Prometheus Endpoint

Prometheus service endpoint:

```
<PROMETHEUS_ENDPOINT>
```

This endpoint will be used by Grafana as datasource.