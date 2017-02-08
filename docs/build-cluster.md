# Build the Kubernetes cluster

## 1. Create Infrastructure

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

```
$ export TF_VAR_digital_ocean_token=<your_token>
$ make plan
```

To apply the changes execute the following commands:

```
$ export TF_VAR_digital_ocean_token=<your_token>
$ make apply
```

## 2. Provision Kubernetes cluster

To provision the Kubernetes cluster execute one of the following commands:

`make get-kismatic-for-mac` or `make get-kismatic-for-linux`

Now update the `kismatic-cluster.yaml` in the root directory with the following changes,

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

Update the remainder of the IP address in the `kismatic-cluster.yaml` under `etcd` and `worker`. You will also need to ensure that the absolute path referred to by `ssh_key` points to the location of the `ssh/cluster.pem` file in your cloned copy of the repository.

Once you have filled in the YAML file execute the following command:

```
$ make provision-cluster
```

## 3. Download and install Kubectl

Finally in order to be able to interact with our cluster we need to install Kubectl.

To install Kubectl execute one of the following commands:

`make get-kubectl-for-mac` or `make get-kubectl-for-linux`
