# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision "shell", path: "update-apt.sh"
  config.vm.provision "shell", path: "install-iftop.sh"
  config.vm.provision "shell", path: "add-host-name.sh", args: "mongo 192.168.33.15"

  config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--groups", "/MongoDB"]
      v.customize ["modifyvm", :id, "--memory", "256"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--vram", "10"]
  end

  config.vm.define "mongo" do |mongo|
      mongo.vm.hostname = "mongodbcourse"
      mongo.vm.provision :shell, path: "install-mongo.sh", args: "vagrant"
#      mongo.vm.provision :shell, path: "provision-mongodb-replica-set.sh"
      mongo.vm.network :private_network, ip: "192.168.33.15"
      mongo.vm.provider "virtualbox" do |v|
          # Careful, this name is global to your vbox install... make sure it is unique.
          v.name = "vagrant.mongo"
      end
  end
end
