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

| Node | Role | IP | Status |
|------|------|----|--------|
| k8s-cp1 | Control Plane | 192.168.50.11 | Active |
| k8s-worker1 | Worker | 192.168.50.21 | Active |
| k8s-worker2 | Worker | 192.168.50.22 | Active |
| rancher-mgmt-1 | Rancher Management | 192.168.50.41 | Active |

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
NGINX Edge Proxy
  │
  ├── Rancher UI
  ├── Prometheus UI
  ├── Grafana UI
  └── Future platform services
          │
          ▼
RKE2 Management Cluster
  └── Rancher
          │
          ▼
Talos Kubernetes Cluster
  ├── k8s-cp1
  ├── k8s-worker1
  └── k8s-worker2