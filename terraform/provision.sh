#!/bin/sh
echo "Provisioning boostrap machine ..."

echo "Installing necessary packages ..."
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
sudo apt-get -qq update
DEBIAN_FRONTEND=noninteractive apt-get -qq upgrade
sudo apt-get -qq install -y build-essential git
sudo apt-get -qq install python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python
sudo apt-get -qq update

echo "Clone the repo ..."
git clone https://github.com/apprenda/hands-on-with-kubernetes-workshop.git

echo "Downloading KET ..."
make get-dependencies -C ~/hands-on-with-kubernetes-workshop/
