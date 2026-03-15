# Alerts

## Planned Alerts

- Node down
- Node CPU saturation
- Disk usage high
- Pod restart loops
- Kubernetes node NotReady
- Prometheus scrape failures

## Example Expressions

### Node down
```promql
up == 0