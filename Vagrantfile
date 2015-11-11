# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "xpeppers/devops-jumpstart"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.memory = "1024"
  end

  config.vm.define :default do |development|
    development.vm.network :forwarded_port, guest: 80, host: 8000
    development.vm.network "private_network", ip: "192.168.42.10"

    development.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end

  config.vm.define :ci do |ci|
    ci.vm.network :forwarded_port, guest: 8080, host: 9000
    ci.vm.network "private_network", ip: "192.168.42.20"

    ci.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
      chef.add_recipe "ci::default"
    end
  end

  config.vm.define :testing do |testing|
    testing.vm.network :forwarded_port, guest: 80, host: 10000
    testing.vm.network "private_network", ip: "192.168.42.30"

    testing.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end

  config.vm.define :production do |production|
    production.vm.network :forwarded_port, guest: 80, host: 11000
    production.vm.network "private_network", ip: "192.168.42.40"

    production.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end
end
