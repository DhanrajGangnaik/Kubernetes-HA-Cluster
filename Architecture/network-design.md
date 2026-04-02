# Network Design

## Network Objectives

- isolate management and workload traffic
- support internal DNS-based service resolution
- expose selected services through a central edge proxy
- allow Kubernetes service advertisement on bare metal

## Core Network Components

- Homelab VLAN / subnet
- Internal DNS server
- Edge NGINX reverse proxy
- MetalLB IP pool
- Ingress controller

## Addressing

| Component | Purpose |
|---------|---------|
| k8s-cp1 | control plane |
| k8s-worker1 | worker |
| k8s-worker2 | worker |
| rancher-mgmt-1 | rancher management |
| MetalLB pool | load balancer addresses |

## DNS Records

| Hostname | Target |
|----------|--------|
| rancher.homelab.internal | edge proxy |
| prometheus-k8s.homelab.internal | edge proxy |
| grafana.homelab.internal | edge proxy |

## Routing Model

Clients access internal services using DNS names. Requests terminate at the edge proxy, which forwards traffic to Kubernetes ingresses, NodePorts, or standalone VM services.

## Diagram

![Network Design](../../Diagrams/network-design.png)