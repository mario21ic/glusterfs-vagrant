#!/bin/bash

echo "### Creating volume testvol1 ###"
sudo gluster volume create testvol1 replica 2 transport tcp server1.example.com:/data/testvol1 server2.example.com:/data/testvol1 force
sudo gluster volume start testvol1
sudo gluster volume status
# Allow to a ip static
sudo gluster volume set testvol1 auth.allow 192.168.1.16
sudo gluster volume info testvol1
sudo gluster volume list
ls -la /data/testvol1

echo "### Creating volume testvol2 ###"
sudo gluster volume create testvol2 replica 2 transport tcp server1.example.com:/data/testvol2 server2.example.com:/data/testvol2 force
sudo gluster volume start testvol2
sudo gluster volume status
sudo gluster volume info testvol2
sudo gluster volume list
ls -la /data/testvol2

