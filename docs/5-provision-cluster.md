# Provisioning the Kubernetes cluster

These steps are to be executed from the boostrap node itself!

## Downloading the necessary dependencies

The following command will download and install Kismatic

```
$ cd hands-on-with-kubernetes-workshop
$ make get-dependencies
```

## Obtain the list of IP addresses

All IP addresses used for the following steps can be found from the output of Terraform.

## Kismatic-cluster.yaml changes

Now update the `kismatic-cluster.yaml` in the root directory of the repo with the following changes:

This can be done by executing the following command:

```
$ nano kismatic-cluster.yaml
```

Note: There **must** be space between the `:` and the ip address you enter!

Add the IP address of Master1 to `ip`, `load_balanced_fqdn` and `load_balanced_short_name` below

```
master:
  expected_count: 1
  nodes:
  - host: master1
    ip:
  load_balanced_fqdn:
  load_balanced_short_name:
```

Update the remainder of the IP address in the `kismatic-cluster.yaml` under `etcd`, 'ingress' and `worker`.

## Provision the cluster using Kismatic

Once you have updated the `kismatic-cluster.yaml` file execute the following command:

```
$ make provision-cluster
```

To validate all is well execute `kubectl get nodes`

You should be shown:

```
NAME       STATUS                     ROLES     AGE       VERSION
ingress1   Ready,SchedulingDisabled   <none>    5m        v1.8.0
master1    Ready,SchedulingDisabled   master    5m        v1.8.0
worker1    Ready                      <none>    5m        v1.8.0
```
