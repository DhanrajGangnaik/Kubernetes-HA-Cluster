## Planned VMs

| VM | Purpose | Notes |
|----|---------|-------|
| k8s-cp1 | Talos control plane | API and scheduling |
| k8s-worker1 | Talos worker | workloads |
| k8s-worker2 | Talos worker | workloads |
| rancher-mgmt-1 | RKE2 + Rancher | management plane |

## Resource Strategy

- minimal but stable VM sizing
- management plane separated from workloads
- observability workloads sized conservatively