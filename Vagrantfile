# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "vagrant-ansible"
  config.vm.box_url = "http://goo.gl/wxdwM"
  config.vm.network :hostonly, "88.88.88.88"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_file = "provisioning/ansible_hosts"
    ansible.verbose = true
  end
end
