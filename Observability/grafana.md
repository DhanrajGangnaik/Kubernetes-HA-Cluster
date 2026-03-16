# Grafana

Grafana is used for **visualizing metrics collected by Prometheus**.

It provides dashboards that allow operators to monitor:

- cluster health
- node resource usage
- application workloads
- infrastructure performance

---

# Deployment Model

Grafana is deployed on a **dedicated monitoring VM** separate from Kubernetes.

This separation provides:

- independent lifecycle
- centralized observability
- ability to monitor multiple clusters

---

# Data Sources

Grafana consumes metrics from the following Prometheus instances.

| Datasource | Purpose |
|------------|--------|
| infrastructure Prometheus | Node and infrastructure monitoring |
| Rancher Kubernetes Prometheus | Kubernetes cluster monitoring |

---

# Example Validation Queries

Example queries used to validate the monitoring pipeline.
```
up
```
---
Confirms scrape targets are reachable.
```
node_uname_info
```
---
Verifies node exporter metrics.
```
kube_node_info
```
---
Confirms Kubernetes cluster metrics.
---

# Dashboard Organization

Dashboards are organized into the following logical groups:

| Folder | Purpose |
|------|------|
| Kubernetes | Cluster monitoring |
| Infrastructure | Node hardware metrics |
| Databases | Database monitoring |
| Monitoring Platform | Prometheus health |

---

# Access

Grafana is exposed via the edge proxy:


http://grafana.homelab.internal


---

# Future Improvements

- GitOps dashboard provisioning
- automated dashboard versioning
- alerting dashboards