# Accessing the bootstrap node

The output from Terraform should look something like below:

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

bootstrap_node_ip = 138.68.173.59
bootstrap_ssh_command = ssh -i ssh/cluster.pem root@138.68.173.59
etcd_node_ips = 138.68.173.58
ingress_node_ips = 138.68.173.47
master_node_ips = 138.68.173.48
worker_node_ips = 138.68.173.52
```

From a new tab, browse to the repo location and execute the following command:

```
$ ssh -i ssh/cluster.pem root@<bootstrap_node_ip>
```

To provision the cluster click [here](5-provision-cluster.md)