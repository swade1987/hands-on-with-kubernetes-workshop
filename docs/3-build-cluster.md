# Build the Kubernetes cluster

## Prerequisite

All commands need to be executed from the repositories root directory via Terminal or Git Bash.

When you execute `pwd` you should see `hands-on-with-kubernetes-workshop` (see below):

```
github.com/apprenda/hands-on-with-kubernetes-workshop
```

## 1. Changing cluster node location

It is possible to change the physical location of the nodes created within Digital Ocean.

This is possible by changing the `region` variable within `/terraform/variables.tf`

## 2. Change the unique identifer

The `unique_identifier` variable within `/terraform/variables.tf` needs to be updated.

It is recommended that this is set to `firstname-lastname`.

## 3. Generate new SSH keypair

Before creating our infrastructure we need to create an SSH keypair.

This key will be used by both Terraform and the Kismatic Toolkit.

If you are using a Macbook or Linux, execute: `make ssh-keypair`.

If on Windows execute the following commands via gitbash:

```
$ make ssh-keypair
```

## 4. Create Infrastructure

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

Note: You will need to paste in the Digital Ocean Token during the Terraform execution.

Execute the following commands via the Terminal or Git Bash:

```
$ make cluster
```

## 5. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-accessing-the-bootstrap-node.md)
