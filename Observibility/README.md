# Observability

This directory documents the monitoring and observability model of the platform.

## Current Stack

- Rancher Monitoring Prometheus in Kubernetes
- External Grafana VM
- Node exporter
- kube-state-metrics
- PushProx components
- Prometheus dashboards

## Current Flow

```text
Grafana VM
   ↓
prometheus-k8s.homelab.internal
   ↓
Edge Proxy
   ↓
Rancher Prometheus