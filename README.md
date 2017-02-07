# Hands on with Kubernetes Workshops

A demo repo for running the Kismatic Enterprise Toolkit on Digital Ocean

The following repository will create you a Kubernetes cluster using the following:

1. The underlying Infrastructure using Digital Ocean
2. Infrastructure creation using Terraform
3. Cluster provisoning using the Kismatic Enterprise Toolkit (KET)

## Prerequisities

### 1. Terraform

Before using this repository you will need to download and install [Terraform](https://www.terraform.io/)

This can be downloaded from [here](https://www.terraform.io/downloads.html)

Download and place the Terraform binary in your preferred location, then tweak the command below and execute it:

```
$ PATH=/usr/local/terraform/bin:<terraform location>:$PATH
```

### 2. Digital Ocean account

You will also require an account on [https://www.digitalocean.com/](https://www.digitalocean.com/)

## Usage

### 1. Create Infrastructure

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

```
$ export TF_VAR_digital_ocean_token=
$ make plan
```

To apply the changes execute the following commands:

```
$ export TF_VAR_digital_ocean_token=
$ make apply
```

### 2. Provision Kubernetes cluster

To provision the Kubernetes cluster execute the following command:

```
$ make get-kismatic
```

Now update the `kismatic-cluster.yaml` to have the correct IP addresses (make sure you add the IP for master to `load_balanced_fqdn` and `load_balanced_short_name`), once you have filled that in execute:

```
$ make provision-cluster
```

Note: You can specify which version of KET by updating the `KISMATIC_VERSION` variable in the Makefile.

### 3. Deploy the application

To deploy the demo application execute the following command:

```
$ kubectl --kubeconfig kubeconfig apply -f demo-app
```

Run

```
kubectl --kubeconfig kubeconfig get services
```

You will get something like:

```
NAME          CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
hello-world   128.0.0.1   <nodes>       8080:31684/TCP     5m
kubernetes    128.0.0.1     <none>        443/TCP          8m
```

Run

```
kubectl --kubeconfig kubeconfig describe service hello-world
```

You will get something like:

```
Name:			hello-world
Namespace:		default
Labels:			<none>
Selector:		app=hello-world
Type:			NodePort
IP:			128.0.0.1
Port:			<unset>	8080/TCP
NodePort:		<unset>	31684/TCP
Endpoints:		128.0.0.1:8080,128.0.0.1:8080
Session Affinity:	None
No events.
```

Now execute the following command:

```
$ while true; do curl http://<worker ip>:<node port>; sleep 1; done;
```