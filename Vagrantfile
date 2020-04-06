# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provision "shell", inline: "echo '### Iniciando ###'"

  config.vm.define "worker1" do |w|
    w.vm.box = "hashicorp/bionic64"
    w.vm.network "public_network", use_dhcp_assigned_default_route: true, ip: "192.168.1.20", bridge: "enp3s0"
    w.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    w.vm.provision "shell", path: "install.sh"
  end

  config.vm.define "worker2" do |w|
    w.vm.box = "hashicorp/bionic64"
    w.vm.network "public_network", use_dhcp_assigned_default_route: true, ip: "192.168.1.21", bridge: "enp3s0"
    w.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    w.vm.provision "shell", path: "install.sh"
    w.vm.provision "shell", path: "make_volume.sh"
  end

  #config.vm.provision "shell", path: "make_vols.sh"
end
