# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define 'nagiosserver' do |node|
    node.vm.box = 'chef/ubuntu-14.10'
    node.vm.network 'private_network', ip: '172.28.128.3'
    node.vm.hostname = 'nagiosserver'
    
    node.vm.provision 'chef_zero' do |chef|
      chef.roles_path = 'roles'
      chef.data_bags_path = 'data_bags'
      chef.add_role 'monitoring'
    end
  end

end
