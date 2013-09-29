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

    tinge.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine::tinge"
    end
  end

  config.vm.define "blend" do |blend|
    blend.vm.network :private_network, ip: "192.168.57.11"

    blend.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine::blend"
    end
  end

  config.vm.define "spread" do |spread|
    spread.vm.network :private_network, ip: "192.168.57.12"

    spread.vm.provision :chef_solo do |chef|
      chef.add_recipe "margarine::spread"
    end
  end

  config.vm.define 'margarine' do |margarine|
    margarine.vm.network :private_network, ip: '192.168.57.13'

    margarine.vm.provision :chef_solo do |chef|
      chef.data_bags_path = '.data_bags'

      chef.add_recipe 'chef-solo-search'
      chef.add_recipe 'margarine'
    end
  end
end
