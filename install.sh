#!/bin/bash

echo "### Configuring Hostnames ###"
#ip addr
echo "192.168.1.20 server1.example.com server1" | sudo tee --append /etc/hosts
echo "192.168.1.21 server2.example.com server2" | sudo tee --append /etc/hosts
#ping server1.example.com server1

echo "### Installing glusterfs ###"
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:gluster/glusterfs-7 -y
sudo apt update
sudo apt install glusterfs-server -y
glusterfsd --version

echo "### Testing cluster ###"
mkdir /data
sudo gluster peer probe server2.example.com
sudo gluster peer probe server1.example.com
sudo gluster peer status
#netstat -tap | grep glusterfsd

