# Accessing the bootstrap node

The output from Terraform should look something like below:

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

bootstrap_ssh_command = ssh -i ssh/cluster.pem root@178.62.73.246
ingress_node_ip = 178.62.14.241
kubernetes_dashboard_url = https://178.62.12.143:6443/ui
master_node_ip = 178.62.12.143
worker_node_ip = 178.62.61.186
```

## SSH into the bootstrap node

* Execute the command `pwd` and copy the output
* Open a new terminal tab
* Then `cd` to that directory (e.g. `cd github.com/apprenda/hands-on-with-kubernetes-workshop`)
* Execute `pwd` you should see `hands-on-with-kubernetes-workshop` in the output
* Then execute the following command: `ssh -i ssh/cluster.pem root@<bootstrap_node_ip>`

To provision the cluster click [here](5-provision-cluster.md)