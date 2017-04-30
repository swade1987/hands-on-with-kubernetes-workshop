# Clear Down

These steps are required to clear down the workshop

## 1. Remove droplets from Digital Ocean

From your **virtual machine** execute the following commands:

```
$ cd /home/vagrant/hands-on-with-kubernetes-workshop/terraform
$ terraform destroy --force
```

## 2. Remove virtual machine

From your **local machine** execute the following command:

```
$ make destroy-vagrant-box
```