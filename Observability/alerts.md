# Alerting Strategy

Alerting ensures platform operators are notified when infrastructure or workloads become unhealthy.

Alerts will be implemented using **Prometheus Alertmanager**.

---

# Planned Alerts

The following alerts will be implemented.

| Alert | Description |
|------|-------------|
| Node Down | A Kubernetes node becomes unreachable |
| High CPU Usage | Node CPU utilization exceeds threshold |
| Disk Usage High | Disk capacity nearing exhaustion |
| Pod CrashLoopBackOff | Pod restart loops detected |
| Kubernetes Node NotReady | Node enters NotReady state |
| Prometheus Scrape Failure | Monitoring pipeline failure |

---

# Example Alert Rules

## Node Down
```
up == 0
```
---
## High CPU Utilization
```
avg(rate(node_cpu_seconds_total{mode!="idle"}[5m])) > 0.9
```
---
## Disk Usage High
```
(node_filesystem_size_bytes - node_filesystem_free_bytes)
/
node_filesystem_size_bytes
```
```
0.85
```
---

# Future Alerting Improvements

- Slack / Discord notifications
- PagerDuty integration
- SLO based alerting
- alert noise reduction