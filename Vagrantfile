# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "xpeppers/devops-jumpstart"
  config.vm.box_check_update = false
  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.network "private_network", ip: "192.168.42.10"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "1024"
  end

  config.vm.provision :chef_zero, install: false  do |chef|
    chef.add_recipe "blog::default"
    chef.add_recipe "ci::default"
  end
end
