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

## SSH into the bootstrap node

* Execute the command `pwd` and copy the output
* Open a new terminal tab
* Then `cd` to that directory (e.g. `cd github.com/apprenda/hands-on-with-kubernetes-workshop`)
* Execute `pwd` you should see `hands-on-with-kubernetes-workshop` in the output
* Then execute the following command: `ssh -i ssh/cluster.pem root@<bootstrap_node_ip>`

To provision the cluster click [here](5-provision-cluster.md)