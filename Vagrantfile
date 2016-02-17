# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  config.vm.provider "docker" do |docker|
    docker.image = "xpeppers/devops-jumpstart"
    docker.has_ssh = true
  end
  config.vm.box_check_update = false
  config.ssh.insert_key = false

  config.vm.define :management do |management|
    management.vm.provider "docker" do |docker|
      docker.name = "management"
    end
    management.vm.hostname = "management"
    management.vm.network :forwarded_port, guest: 5044, host: 5044
    management.vm.network :forwarded_port, guest: 5601, host: 5601
    management.vm.network :forwarded_port, guest: 5672, host: 5672
    management.vm.network :forwarded_port, guest: 2000, host: 2000
    management.vm.network :forwarded_port, guest: 3000, host: 3000

    management.vm.provision :chef_solo, install: false  do |chef|
      chef.add_recipe "logging::default"
      chef.add_recipe "monitoring::default"
    end
  end

  config.vm.define :development do |development|
    development.vm.provider "docker" do |docker|
      docker.name = "development"
    end
    development.vm.hostname = "development"
    development.vm.network :forwarded_port, guest: 80, host: 8000

    development.vm.provision :chef_solo, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end

  config.vm.define :testing do |testing|
    testing.vm.provider "docker" do |docker|
      docker.name = "testing"
    end
    testing.vm.hostname = "testing"
    testing.vm.network :forwarded_port, guest: 80, host: 10000

    testing.vm.provision :chef_solo, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end

  config.vm.define :production do |production|
    production.vm.provider "docker" do |docker|
      docker.name = "production"
      docker.link "management:management"
    end
    production.vm.hostname = "production"
    production.vm.network :forwarded_port, guest: 80, host: 11000

    production.vm.provision :chef_solo, install: false  do |chef|
      chef.add_recipe "blog::default"
      chef.add_recipe "logging::client"
      chef.add_recipe "monitoring::client"
      chef.json = {
        "logging" => {
          "host" => "management"
        },
        "monitoring" => {
          "host" => "management"
        }
      }
    end
  end

  config.vm.define :ci do |ci|
    ci.vm.provider "docker" do |docker|
      docker.name = "ci"
      docker.link "testing:testing"
      docker.link "production:production"
    end
    ci.vm.hostname = "ci"
    ci.vm.network :forwarded_port, guest: 8080, host: 9000

    ci.vm.provision :chef_solo, install: false  do |chef|
      chef.add_recipe "blog::default"
      chef.add_recipe "ci::default"
    end
  end

end
