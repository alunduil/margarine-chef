# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-berkshelf"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  [ :tinge, :blend, :spread ].each do |component|
    config.vm.define component do |box|
      box.vm.synced_folder '.', '/vagrant', :disabled => true

      box.vm.provision :chef_solo do |chef|
        chef.add_recipe 'apt'
        chef.add_recipe "margarine::#{component}"
      end
    end
  end

  config.vm.define 'margarine' do |margarine|
    margarine.vm.synced_folder '.', '/vagrant', :disabled => true

    margarine.vm.provision :chef_solo do |chef|
      chef.add_recipe 'apt'
      chef.add_recipe 'margarine'
    end
  end
end
