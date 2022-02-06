Vagrant.configure("2") do |config|
  USE_GUI = true
  config.vm.box = "terrywang/archlinux"

  #config.vm.network "private_network", ip: "172.28.128.100"
  config.vm.synced_folder "./", "/home/vagrant/workstation-config/"
  config.vm.synced_folder "./", "/home/user/workstation-config/", create: true, mount_options: ["dmode=777,fmode=666"]

  config.vm.provision "shell", inline: "ls && id -a && pacman -Sy --noconfirm python"
  config.vm.provision "shell", inline: "pacman -S net-tools --noconfirm"
  if Vagrant::Util::Platform.windows?
    config.vm.provision "shell", inline: "ansible-galaxy collection install -p /home/vagrant/.ansible/roles community.general"
    config.vm.provision "shell", inline: "ansible-galaxy collection install -p /home/vagrant/.ansible/roles kewlfft.aur"
    config.vm.provision "shell", inline: "chown -R vagrant /home/vagrant/.ansible"
  end

  provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible
  config.vm.provision provisioner do |ansible|
    ansible.playbook = "vagrant.yml"
  end
  config.vm.provider "virtualbox" do |vbox|
    if USE_GUI
      vbox.memory = 2048
      vbox.cpus = 1
      vbox.gui = true
      config.disksize.size = "50GB"
    end
  end
end
