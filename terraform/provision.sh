#!/bin/sh
echo "Adding necessary repositories"
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse"
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse"
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse"
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu xenial universe"

echo "Upgrade and install build-essential and other necessary packages"
sudo apt-get update -y
sudo apt-get install -y build-essential git wget
sudo apt-get install -qq python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python
