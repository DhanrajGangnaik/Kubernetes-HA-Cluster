# Observability

This directory documents the **monitoring and observability architecture** of the Kubernetes HA platform.

The monitoring stack provides visibility into:

- Kubernetes cluster health
- Node resource utilization
- Workload performance
- Infrastructure capacity
- Monitoring system health

The objective is to replicate a **production-grade observability model used in platform engineering teams.**

---

# Monitoring Stack

The platform uses the following components:

| Component | Purpose |
|-----------|--------|
| Prometheus | Metrics collection and storage |
| Grafana | Visualization and dashboards |
| kube-state-metrics | Kubernetes object metrics |
| node-exporter | Node hardware metrics |
| PushProx | Secure scraping across network boundaries |

---

# Deployment Model

Prometheus runs **inside Kubernetes**, while Grafana runs **externally on a monitoring VM**.

```
Grafana VM
│
▼
Prometheus (Rancher Monitoring)
│
▼
Kubernetes Cluster
├── node-exporter
├── kube-state-metrics
└── control plane metrics
```

---

# Observability Capabilities

Current monitoring capabilities include:

- Node hardware monitoring
- Kubernetes cluster health monitoring
- Workload resource monitoring
- Prometheus self-monitoring
- Alerting rules (planned)
- Capacity planning dashboards

---

# Documentation

Detailed configuration documentation is available in:

| File | Description |
|-----|-------------|
| `prometheus.md` | Prometheus architecture and configuration |
| `grafana.md` | Grafana deployment and datasource configuration |
| `dashboards.md` | Available dashboards |
| `alerts.md` | Planned alerting rules |
| `rancher-monitoring.md` | Rancher monitoring stack details |

---

# Future Improvements

Planned observability enhancements:

- Alertmanager integration
- Infrastructure SLO dashboards
- CI/CD pipeline monitoring
- Database monitoring
- Network telemetry dashboards