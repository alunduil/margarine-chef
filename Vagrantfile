# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-berkshelf"

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.berkshelf.enabled = true

  config.vm.define "tinge" do |tinge|
    tinge.vm.network :private_network, ip: "192.168.57.10"

    config.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine"
      chef.add_recipe "margarine::tinge"
    end
  end

  config.vm.define "blend" do |blend|
    blend.vm.network :private_network, ip: "192.168.57.11"

    config.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine"
      chef.add_recipe "margarine::blend"
    end
  end

  config.vm.define "spread" do |spread|
    spread.vm.network :private_network, ip: "192.168.57.12"

    config.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine"
      chef.add_recipe "margarine::spread"
    end
  end
end
