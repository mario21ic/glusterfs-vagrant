#!/bin/bash
set -e

echo "### Configuring Hostnames ###"
#ip addr
echo "192.168.1.20 server1.example.com server1" | sudo tee --append /etc/hosts
echo "192.168.1.21 server2.example.com server2" | sudo tee --append /etc/hosts

echo "### Installing glusterfs client ###"
sudo add-apt-repository ppa:gluster/glusterfs-7
sudo apt install glusterfs-client

echo "### Mounting ###"
sudo mkdir /mnt/glusterfs1
sleep 60
sudo mount.glusterfs server1.example.com:/testvol1 /mnt/glusterfs1
echo "prueba desde client" | sudo tee --append /mnt/glusterfs1/demo.txt
