#/!bin/bash
sudo apt-get update

#Install Basic Stuff
sudo apt-get install -y vim curl build-essential python dpkg-dev zlib1g-dev libpcre3 libpcre3-dev unzip software-properties-common
# Install Ansible 
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
