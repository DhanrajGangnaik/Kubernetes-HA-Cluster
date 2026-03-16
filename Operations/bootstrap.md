# Cluster Bootstrap Procedure

This document describes how the Kubernetes cluster was bootstrapped using Talos Linux.

---

# Step 1 Generate Talos Config

```
talosctl gen config <CLUSTER_NAME> <CONTROL_PLANE_ENDPOINT>
```

---

# Step 2 Configure Nodes

Apply configuration to nodes:

```
talosctl apply-config
--insecure
--nodes <NODE_IP>
--file controlplane.yaml
```

---

# Step 3 Bootstrap Control Plane

```
talosctl bootstrap
--nodes <CONTROL_PLANE_NODE>
```

---

# Step 4 Verify Cluster

```
kubectl get nodes
```

Expected output:

```
control-plane nodes Ready
worker nodes Ready
```