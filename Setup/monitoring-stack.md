# Monitoring Stack

## Goal

Deploy Rancher Monitoring on the management cluster and expose Prometheus for use by an external Grafana VM.

## Components

- Prometheus
- Grafana
- kube-state-metrics
- node-exporter
- PushProx components
- Prometheus adapter

## Resource Tuning

Default monitoring values were reduced to fit available homelab CPU and memory.

## Validation

```bash
kubectl get pods -n cattle-monitoring-system
kubectl get svc -n cattle-monitoring-system