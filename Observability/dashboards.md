# Grafana Dashboards

This document lists the dashboards used to monitor the platform.

The goal is to provide **visibility across all infrastructure layers.**

---

# Imported Dashboards

The following dashboards are currently deployed.

| Dashboard | Purpose |
|-----------|--------|
| K8s / Compute | Kubernetes compute metrics |
| K8s Cluster Dashboard | Cluster-level metrics |
| K8s Cluster Overview | Overall cluster state |
| K8s Node Exporter Dashboard | Node hardware metrics |
| K8s Pod Monitoring | Pod resource usage |
| Prometheus Self-Monitoring | Prometheus performance |
| Prometheus Stats | Scrape statistics |
| PostgreSQL Dashboards | Database monitoring |
| TimescaleDB Dashboards | Timeseries database monitoring |

---

# Dashboard Categories

Dashboards are organized into logical folders.

| Folder | Purpose |
|------|------|
| Kubernetes | Cluster monitoring |
| Infrastructure | Node hardware metrics |
| Databases | Database performance |
| Monitoring Platform | Monitoring system health |

---

# Example Metrics

## CPU Usage
```
sum(rate(container_cpu_usage_seconds_total[5m]))
```
---
## Memory Usage
```
sum(container_memory_working_set_bytes)
```
---
## Pod Count
```
sum(kube_pod_status_phase{phase="Running"})
```
---

# Future Dashboards Plans

Planned additions:

- cluster capacity planning
- network monitoring
- CI/CD monitoring
- storage monitoring
- security telemetry