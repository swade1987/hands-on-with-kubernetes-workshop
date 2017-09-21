# Build the Kubernetes cluster

## 1. Changing cluster node location

It is possible to change the physical location of the nodes created within Digital Ocean.

This is possible by changing the `region` variable within `/terraform/variables.tf`

## 2. Modify Cluster Tag

We need to modify the cluster tag to refect a unique name.

Open `/terraform/variables.tf` and modify the `cluster_tag` variable to reflect your name.

```
variable cluster_tag {
  description = "A unique tag for the cluster"
  default     = "YOUR-NAME"
}
```

## 3. Generate New RSA keypair

We are going to need to generate a new RSA keypair to authenticate to the ubuntu machines.

Note: Windows users should use `gitbash` and Mac will use `terminal`

```
$ cd ssh
$ ssh-keygen -f cluster.pem
```

## 4. Create Infrastructure

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

Note: You will need to paste in the Digital Ocean Token during the Terraform execution.

```
$ cd terraform
$ terraform plan
```

To apply the changes execute the following commands:

```
$ terraform apply
```

## 5. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-accessing-the-bootstrap-node.md)
