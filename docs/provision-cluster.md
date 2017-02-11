# Provisioning the Kubernetes cluster

These steps are to be executed from the boostrap node itself!

## Downloading the necessary dependencies

The following command will download and install Kismatic and Kubectl

```
$ cd kismatic-enterprise-toolkit-sandbox
$ make get-dependencies
```

## Kismatic-cluster.yaml changes

Now update the `kismatic-cluster.yaml` in the root directory of the repo with the following changes:

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

Update the remainder of the IP address in the `kismatic-cluster.yaml` under `etcd` and `worker`.

## Provision the cluster using Kismatic

Once you have updated the `kismatic-cluster.yaml` file execute the following command:

```
$ make provision-cluster
```
