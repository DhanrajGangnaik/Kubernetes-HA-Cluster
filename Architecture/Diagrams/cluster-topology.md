# Cluster Topology

```text
                    +----------------------+
                    |  User Workstation    |
                    +----------+-----------+
                               |
                               v
                    +----------------------+
                    |   Edge NGINX Proxy   |
                    +----------+-----------+
                               |
        +----------------------+----------------------+
        |                                             |
        v                                             v
+----------------------+                  +----------------------+
| RKE2 Mgmt Cluster    |                  | Talos K8s Cluster    |
| rancher-mgmt-1       |                  | k8s-cp1              |
| Rancher              |                  | k8s-worker1          |
| Prometheus           |                  | k8s-worker2          |
+----------------------+                  +----------------------+