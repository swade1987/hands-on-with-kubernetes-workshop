#!/bin/bash
TERRAFORM_URL=https://releases.hashicorp.com/terraform/0.9.4/terraform_0.9.4_linux_amd64.zip

# Install Dependencies
echo "Installing necessary dependencies"
yum update
yum install -y vim git tree wget unzip

# Install Terraform
echo "Installing terraform"
wget $TERRAFORM_URL
unzip terraform_0.9.4_linux_amd64.zip -d /home/vagrant/bin
rm -rf terraform_0.9.4_linux_amd64.zip

# Clone hands-on-with-kubernetes-workshop
echo "Cloning github.com/apprenda/hands-on-with-kubernetes-workshop"
sudo git clone https://github.com/apprenda/hands-on-with-kubernetes-workshop.git