# Hands on with Kubernetes Workshops

The following repository will create you a Kubernetes cluster using the following:


1. [Digital Ocean](https://www.digitalocean.com/) for the underlying infrastructure.
2. [Terraform (v0.10.4)](https://www.terraform.io/) to create the infrastructure.
3. [Kismatic Enterprise Toolkit (v1.6.1)](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster.

## Prerequisities

A list of prerequisities for Mac can be found [here](docs/1-mac-prerequisities.md)

A list of prerequisities for Windows can be found [here](docs/2-windows-prerequisities.md)

## Build and provision the Kubernetes cluster

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/3-build-cluster.md)

## Hands on with Kubernetes

The presenter will go through a list of demos during the workshop.

## Destroying everything once finished

To remove the droplets from Digital Ocean execute the following from your local machine.

```
$ cd terraform
$ terraform destroy --force
```

## Upgrading Kismatic

A list of steps to upgrade the version of Kismatic used can be found [here](docs/6-upgrading-kismatic.md)
