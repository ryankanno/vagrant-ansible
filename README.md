# Vagrant-Ansible

Nothing to see here.  This is just my vagrant configuration setup to test
my [ansible playbooks](https://github.com/ryankanno/playbooks/).

## Getting started

You'll need to install:

  * [Vagrant 1.2.2](http://downloads.vagrantup.com/)
  * [Ansible 2.1](http://www.ansibleworks.com/docs/gettingstarted.html)

To test out my [ansible playbooks](https://github.com/ryankanno/playbooks/), you'll want to perform the following:

  * Create a configuration file named .vagrant-ansible-cfg [example](https://raw.github.com/ryankanno/vagrant-ansible/master/.vagrant-ansible-cfg.example)
    * ROLES_ENABLED - Should point to the project path <project_root>/provisioning/roles.
    * ROLES_AVAILABLE - Should point to the path where your playbooks are installed.

  * Run `./enrole.sh <ROLE>` to enable a role (defaults to -h with no <ROLE>)

  * Create a playbook.yml file [example](https://raw.github.com/ryankanno/vagrant-ansible/master/provisioning/playbook.yml.example)

  * Make sure to add the role to the playbook.yml in the provisioning directory

  * Run `./disrole.sh <ROLE>` to disable a role (defaults to -h with no <ROLE>)

Once you've enabled a role, run the following:

  * `vagrant up`
  * `vagrant provision`

Voila. Happy VM'ing.

### Example: Testing out the nginx playbook

To test the [nginx playbook](https://github.com/ryankanno/playbooks/tree/master/nginx), you'll want to perform the following:

  * Ensure you have a configuration file named .vagrant-ansible-cfg 
  * `./enrole.sh nginx`
  * Add the nginx role to your playbook.yml file [example](https://github.com/ryankanno/playbooks/blob/master/nginx/example-playbook.yml)

## Note

  * Don't use this structure for a production setup; follow Ansible [best practices](http://www.ansibleworks.com/docs/bestpractices.html)
  * VM is setup on a host only network @ 88.88.88.88
