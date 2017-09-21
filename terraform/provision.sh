#!/bin/sh
echo "Provisioning boostrap machine ..."

echo "Installing necessary packages ..."
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
sudo apt-get install -y build-essential git
sudo apt-get install -qq python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python
sudo apt-get update -y

echo "Clone the repo"
git clone https://github.com/apprenda/hands-on-with-kubernetes-workshop.git
