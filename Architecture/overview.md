# Architecture Overview

## Objective

The platform is designed as a production-style homelab Kubernetes environment with separation between:

- management plane
- workload plane
- ingress and service exposure
- observability stack

## Design Principles

- Immutable node OS with Talos
- Separate Rancher management cluster
- Bare-metal service exposure using MetalLB
- Ingress-based application routing
- External Grafana as central observability UI
- Internal DNS for stable service naming

## Cluster Layers

### Management Layer
RKE2-based management cluster hosting Rancher and cluster-level management services.

### Workload Layer
Talos-based Kubernetes cluster hosting applications and platform services.

### Access Layer
NGINX edge proxy and internal DNS server for standardized service entry points.

### Observability Layer
Rancher Monitoring Prometheus plus external Grafana integration.

## Benefits

- easier upgrades
- cleaner operations
- better fault isolation
- realistic enterprise architecture