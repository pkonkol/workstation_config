# workstation_config
Personal system configuration deployment.

# Prerequisites
`vagrant plugin install vagrant-disksize`

Some other deps:
```
galaxy:
    community.general
    kewlfft.aur
plugin:
    vagrant-guest_ansible (for provisioning on windows)
```

# Usage for arch

1. On clean system:
```sh
sudo pacman -S ansible
ansible-galaxy collection install -r requirements.yml
```

2. Use with `vagrant provision`
    Self explanatory, works only on linux

1. Use on localhost
  * If using `vagrant ssh` then `cd /home/vagrant/workstation-config`
  * `ansible-playbook -i 127.0.0.1, -c local -v main.yml --tags core` for CLI only or
  * `ansible-playbook -i 127.0.0.1, -c local -v main.yml --tags core,gui` for both CLI and
    gui with i3 configuration

1. Use through ansible-pull
   `ansible-pull -U https://github.com/pkonkol/workstation_config -i 127.0.0.1, -c local -v main.yml`

# Usage for Ubuntu

1. `cd Ubuntu && vagrant up`
1. `vagrant ssh`
1. `cd /home/vagrant/workstation-config`
1. `ansible-playbook -i 127.0.0.1, -c local -v main.yml --tags core` 

# TODO
 So i don't forget
 - i3 ricing (usable but not pretty for now)
 - speed up zsh loading (zplug is too slow)
 - move package lists from role file to group vars
