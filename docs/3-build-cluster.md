# Build the Kubernetes cluster

## 1. Changing cluster node location and ssh keypair name

It is possible to change the physical location of the nodes created within Digital Ocean.

This is possible by changing the `region` variable within `/terraform/variables.tf`

Additionally change the `ssh_key_name` variable within `/terraform/variables.tf`

## 2. Generate new SSH keypair

Before creating our infrastructure we need to create an SSH keypair.

This key will be used by both Terraform and the Kismatic Toolkit. To create this execute:

```
$ mkdir ssh
$ cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""
$ chmod 600 ssh/cluster.pem
```

Note: Windows users should use `gitbash`

## 3. Create Infrastructure

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

Note: You will need to paste in the Digital Ocean Token during the Terraform execution.

```
$ cd terraform
$ terraform init
$ terraform plan
```

To apply the changes execute the following commands:

```
$ terraform apply
```

## 4. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-accessing-the-bootstrap-node.md)
