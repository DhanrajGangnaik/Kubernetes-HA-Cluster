# Node Layout

## Talos Cluster Nodes

| Node | Role | Function |
|------|------|----------|
| k8s-cp1 | Control Plane | API server, scheduler, controller |
| k8s-worker1 | Worker | workload execution |
| k8s-worker2 | Worker | workload execution |

## Rancher Management Cluster

| Node | Role | Function |
|------|------|----------|
| rancher-mgmt-1 | RKE2 control plane | Rancher and management services |

## Scheduling Notes

- control plane node handles cluster services
- workers run application workloads
- Rancher is isolated from Talos workload cluster