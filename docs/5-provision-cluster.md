# Provisioning the Kubernetes cluster

These steps are to be executed from the boostrap node itself!

## Downloading the necessary dependencies

The following command will download and install Kismatic and Kubectl

```
$ cd hands-on-with-kubernetes-workshop
$ make get-dependencies
```

## Obtain the list of IP addresses

All IP addresses used for the following steps can be found [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop)**

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
NAME       STATUS                     AGE
ingress1   Ready,SchedulingDisabled   1h
master1    Ready,SchedulingDisabled   1h
worker1    Ready                      1h
```
