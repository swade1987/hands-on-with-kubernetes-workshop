# Provisioning the Kubernetes cluster

## IMPORTANT

These steps are to be executed from the boostrap node itself!

## Review the kismatic-cluster.yaml changes

If you `less kismatic-cluster.yaml` and scroll to the bottom you should see that Terraform has interpolated the IP addresses for the nodes.

Here is what you would see for the master node where `<master_ip_address>` will be your master's IP address:

```
master:
  expected_count: 1
  nodes:
  - host: master1
    ip: <master_ip_address>
  load_balanced_fqdn: <master_ip_address>
  load_balanced_short_name: <master_ip_address>
```

## Provision the cluster using Kismatic

Once you have updated the `kismatic-cluster.yaml` file execute the following command:

```
$ make provision-cluster
```

To validate all is well execute `kubectl get nodes`

You should be shown:

```
NAME       STATUS                     ROLES     AGE       VERSION
ingress1   Ready,SchedulingDisabled   <none>    5m        v1.9.0
master1    Ready,SchedulingDisabled   master    5m        v1.9.0
worker1    Ready                      <none>    5m        v1.9.0
```
