# Prometheus

Prometheus serves as the **central metrics collection system** for the Kubernetes HA cluster.

It gathers metrics from Kubernetes components, nodes, and workloads, enabling monitoring, alerting, and visualization.

---

# Role in the Platform

Prometheus collects metrics from:

| Source | Purpose |
|------|------|
| node-exporter | Node hardware metrics |
| kube-state-metrics | Kubernetes object state |
| Kubernetes control plane | API server / scheduler |
| Prometheus itself | Monitoring health |

---

# Exposure Model

Prometheus is exposed using a **NodePort service** and accessed through the external proxy layer.

```
Grafana VM
│
▼
Edge Proxy
│
▼
Prometheus NodePort
│
▼
Kubernetes Monitoring Stack
```

---

# Metrics Collection

Prometheus scrapes metrics from multiple sources.

Example metric endpoints:
```
http://node-exporter:9100/metrics
http://kube-state-metrices:8080/metrics
```
---

# Validation

Prometheus configuration can be validated using:
```
promtool check config /etc/prometheus/prometheus.yml
```

---

# Target Monitoring

Targets can be inspected via:


Status → Targets


Healthy targets should appear as:


State: UP


---

# Design Decision

Metrics are collected **directly from Prometheus** instead of the Rancher UI endpoint.

This avoids unnecessary abstraction and ensures metrics are collected directly from the monitoring stack.

---

# Future Improvements

Planned enhancements:

- Alertmanager integration
- remote metrics storage
- long-term metrics retention
- federated Prometheus architecture