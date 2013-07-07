# Vagrant-Ansible

Nothing to see here.  This is just my vagrant configuration setup to test
my [ansible playbooks](https://github.com/ryankanno/playbooks/).

## Getting started

You'll need to install:

  * [Vagrant 1.2.2](http://downloads.vagrantup.com/)
  * [Ansible 2.1](http://www.ansibleworks.com/docs/gettingstarted.html)

To test out my [ansible playbooks](https://github.com/ryankanno/playbooks/), you'll want to perform the following:

  * Symlink the playbook directory into the roles directory <br/><br/> `ln -s <playbook_dir> roles/playbook_dir_name`

  * Symlink the playbook.yml file to provisioning/playbook.yml. <br/><br/> `ln -s <playbook_you_want_to_test> provisioning/playbook.yml`

Once you've setup the appropriate structure, run the following:

  * `vagrant up`
  * `vagrant provision`

Voila. Happy VM'ing.

### Example: Testing out the nginx playbook

To test the [nginx playbook](https://github.com/ryankanno/playbooks/tree/master/nginx), you'll want to perform the following:

  * Create a symlink from the [nginx playbook directory](https://github.com/ryankanno/playbooks/tree/master/nginx) to roles/nginx
  * Create a symlink from [example-playbook.yml](https://github.com/ryankanno/playbooks/blob/master/nginx/example-playbook.yml) to provisioning/playbook.yml

## Note

As a note, the vm is setup on a host only network @ 88.88.88.88
