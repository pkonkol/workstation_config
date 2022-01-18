# workstation_config
Personal system configuration deployment.

# Usage for arch

1. Use with `vagrant provision`
    Self explanatory, works only on linux

1. Use manually with vagrant VM
  * Ssh into the goal machine to add it to known_hosts
  * Run `ansible-playbook -v arch-vagrant-ssh.yml -l vagrant-arch`
  * TBD remove arch-vagrant-ssh.yml and hosts, crete command for running it
    from arch-cli or arch-gui

1. Use on localhost
  * If using `vagrant ssh` then `cd /home/vagrant/workstation-config`
  * `ansible-playbook -i 127.0.0.1, -c local -v arch-cli.yml` for CLI only or
  * `ansible-playbook -i 127.0.0.1, -c local -v arch-gui.yml` for both CLI and
    gui with i3 configuration

# Usage for Ubuntu

1. `cd Ubuntu && vagrant up`
1. `vagrant ssh`
1. `cd /home/vagrant/workstation-config`
1. `ansible-playbook -i 127.0.0.1, -c local -v ubuntu-cli.yml` 
   *** Not working atm because of hardcoded pacman use in >core ***


