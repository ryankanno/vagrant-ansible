# Vagrant-Ansible

Nothing to see here.  This is just my vagrant configuration setup to test
my [ansible playbooks](https://github.com/ryankanno/playbooks/).

## Getting started

You'll need to install:

  * [Vagrant 1.2.2](http://downloads.vagrantup.com/)
  * [Ansible 1.2+](http://www.ansibleworks.com/docs/gettingstarted.html)

To test out my [ansible playbooks](https://github.com/ryankanno/playbooks/), you'll want to perform the following:

  * Create a configuration file named .vagrant-ansible-cfg ([example](https://raw.github.com/ryankanno/vagrant-ansible/master/.vagrant-ansible-cfg.example))
    * ROLES_ENABLED - Should point to the project path &lt;project_root&gt;/provisioning/roles.
    * ROLES_AVAILABLE - Should point to the path where your playbooks are installed.

  * Run `./enrole.sh <ROLE>` to enable a role (defaults to -h with no &lt;ROLE&gt;)

  * Create a playbook.yml file in provisioning directory ([example](https://raw.github.com/ryankanno/vagrant-ansible/master/provisioning/playbook.yml.example))

  * Make sure to add the role to the playbook.yml

Once you've enabled a role, run the following:

  * `vagrant up`
  * `vagrant provision`

After you're done testing:

  * Run `./disrole.sh <ROLE>` to disable a role (defaults to -h with no &lt;ROLE&gt;)

Note:

  * Run `./disrole.sh all` to disable all roles (defaults to no, may change that option later since it's explicit)

Voila. Happy VM'ing.

### Example: Testing out the apt playbook

To test the [apt playbook](https://github.com/ryankanno/playbooks/tree/master/apt), you'll want to perform the following:

  * Ensure you have a configuration file named .vagrant-ansible-cfg 
  * `./enrole.sh apt`
  * Add the apt role to your playbook.yml file

## Note

  * Don't use this structure for a production setup; follow Ansible [best practices](http://www.ansibleworks.com/docs/bestpractices.html)
  * VM is setup on a host only network @ 88.88.88.88
