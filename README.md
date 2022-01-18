# workstation_config
Personal system configuration deployment.

# Usage for arch

1. Use with `vagrant provision`
    
    Self explanatory

1. Use manually with vagrant VM

  * Try to ssh into goal machine to add it to known_hosts
  * Run `ansible-playbook -v main.yml -l vagrant-arch`

1. Use on localhost

  * If using `vagrant ssh` then `cd /home/vagrant/workstation-config`
  * `ansible-playbook -i hosts -l localhost-arch main.yml`

# Usage for Ubuntu

1. `cd Ubuntu && vagrant up`
1. `vagrant ssh`
1. `cd /home/vagrant/workstation-config`
2. `ansible-playbook -i hosts -l localhost-ubuntu main.yml`


