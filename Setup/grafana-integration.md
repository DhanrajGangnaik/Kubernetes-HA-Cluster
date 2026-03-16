# Grafana Integration

Grafana is deployed on an external monitoring VM. It connects to Prometheus running inside the Kubernetes cluster.

---

# How to add Prometheus Data Source

Open Grafana.

Navigate to:

```
Connections
→ Data Sources
→ Prometheus
```

Enter the endpoint:

```
<PROMETHEUS_ENDPOINT>
```

Save and test connection.

---

# Import Dashboards

Navigate to:

```
Dashboards
→ Import
```
---

## Recommended dashboards:

- Kubernetes Cluster Monitoring
- Kubernetes Control Plane
- Node Exporter
- Cluster Capacity Planning

---

# Verify Metrics

Open dashboard.

Ensure metrics display for:

- CPU usage
- memory usage
- pod count
- namespace metrics