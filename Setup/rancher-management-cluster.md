# Why Separate Management Cluster

Rancher chart compatibility blocked direct installation on the Talos Kubernetes version in use. To avoid downgrading the Talos workload cluster, a dedicated RKE2 management cluster was created.

## Steps Performed

1. created `rancher-mgmt-1`
2. installed RKE2
3. verified kube-system components
4. installed cert-manager
5. installed Rancher
6. configured DNS and proxy path for Rancher UI

## Result

Rancher became operational on the separate management cluster.