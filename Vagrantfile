# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure(2) do |config|
  config.vm.provider "docker" do |docker|
    docker.image = "xpeppers/devops-jumpstart"
    docker.has_ssh = true
  end
  config.vm.box_check_update = false
  config.ssh.insert_key = false

  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.provision :chef_solo, install: false  do |chef|
    chef.add_recipe "blog::default"
  end
end
