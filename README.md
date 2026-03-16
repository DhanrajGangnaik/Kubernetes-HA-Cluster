# Kubernetes HA Cluster

Enterprise-style homelab Kubernetes platform built with Talos Linux, Rancher, MetalLB, NGINX Ingress, local persistent storage, and integrated observability.

## Project Goals

This repository documents the end-to-end design, deployment, operations, and monitoring of a highly available Kubernetes environment built in a homelab setting. The objective is to simulate a real platform engineering environment using production-style tooling and workflows.

## Core Components

- **Talos Linux** for immutable Kubernetes nodes
- **Kubernetes** multi-node cluster
- **MetalLB** for bare-metal load balancing
- **NGINX Ingress Controller** for service exposure
- **Local Path Provisioner** for persistent storage
- **Rancher** for multi-cluster management
- **Prometheus + Grafana** for observability
- **External NGINX Proxy** for centralized service access
- **Internal DNS** for clean service discovery

## Cluster Overview

| Node | Role | Status |
|-----|------|------|
| control-plane-1 | Control Plane | Active |
| control-plane-2 | Control Plane | Active |
| control-plane-3 | Control Plane | Active |
| worker-1 | Worker | Active |
| worker-2 | Worker | Active |
| worker-3 | Worker | Active |
| worker-4 | Worker | Active |
| worker-5 | Worker | Active |
| worker-6 | Worker | Active |

---

## Management Components

| Component | Purpose |
|----------|--------|
| Rancher Server | Kubernetes management plane |
| Monitoring VM | External Grafana dashboards |
| Edge Proxy | Service routing and ingress |

---

## Current Capabilities

- Highly available Talos-based Kubernetes cluster
- Rancher management plane on separate RKE2 management cluster
- Bare-metal load balancing with MetalLB
- Ingress routing with NGINX
- Persistent storage for workloads
- Rancher Monitoring deployed
- External Grafana integrated with Rancher Prometheus

## Repository Map

- [`Architecture/`](./Architecture/) — design and topology
- [`Setup/`](./Setup/) — build sequence and installation steps
- [`Operations/`](./Operations/) — maintenance and runbooks
- [`Observability/`](./Observability/) — monitoring stack and dashboards
- [`Scripts/`](./Scripts/) — helper scripts
- [`docs/`](./docs/) — journey, issues, lessons, roadmap

## High-Level Architecture

```text
Users
│
▼
Edge Proxy / Ingress
│
├── Rancher UI
├── Grafana UI
├── Prometheus UI
└── Kubernetes services
│
▼
Rancher Management Plane
│
▼
Talos Kubernetes HA Cluster
├── Control Plane Nodes
├── Worker Nodes
├── MetalLB
├── Ingress Controller
├── kube-state-metrics
└── node-exporter
```

---

# Observability Model

The monitoring stack uses a **hybrid architecture**.

Prometheus runs **inside the Kubernetes cluster** using Rancher Monitoring.

Grafana runs **outside the cluster** on a dedicated monitoring VM.

```
Grafana
↓
Prometheus (Rancher Monitoring)
↓
Kubernetes cluster
├ node exporter
├ kube state metrics
└ control plane metrics
```

