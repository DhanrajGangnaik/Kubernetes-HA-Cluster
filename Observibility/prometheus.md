# Prometheus

## Purpose

Prometheus serves as the central metrics collection layer for Kubernetes and node-level metrics.

## Current Exposure Model

- service type patched to NodePort
- routed via edge proxy
- consumed by external Grafana

## Notes

Direct scraping of Rancher UI `/metrics` was not used, because Rancher monitoring should be consumed from the Prometheus stack itself, not from the UI endpoint.