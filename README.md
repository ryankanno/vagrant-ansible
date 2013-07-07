# Vagrant-Ansible

Nothing to see here.  This is just my vagrant configuration setup to test
my [ansible playbooks](https://github.com/ryankanno/playbooks/).

## Getting started

You'll need to install the following:

  * [Vagrant](http://downloads.vagrantup.com/)
  * [Ansible](http://www.ansibleworks.com/docs/gettingstarted.html)

(The following has been tested on Vagrant 1.2.2 and Ansible 1.2)

To test out the [ansible playbooks](https://github.com/ryankanno/playbooks/), 
make sure to create a symlink @ provisioning/playbook.yml to the playbook 
you want to test.

`ln -s <playbook_you_want_to_test> provisioning/playbook.yml`

For example, to test out the [nginx playbook](https://github.com/ryankanno/playbooks/tree/master/nginx),
you'll want to create a symlink from [example-playbook.yml](https://github.com/ryankanno/playbooks/blob/master/nginx/example-playbook.yml)
to provisioning/playbook.yml.

## Note

As a note, the vm is setup on a host only network @ 88.88.88.88
