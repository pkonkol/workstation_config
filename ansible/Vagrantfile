Vagrant.configure("2") do |config|
  USE_GUI = true
  config.vm.box = "archlinux/archlinux"

  #config.vm.network "private_network", ip: "172.28.128.100"
  # mount below only after running core role
  # config.vm.synced_folder "./", "/home/user/workstation-config/" , mount_options: ["dmode=777,fmode=666"]
  config.vm.synced_folder "./", "/home/vagrant/workstation-config/"

  config.vm.provision "shell", privileged: false, inline: "echo '[defaults]\nnocows=True\nask_valut_pass=True' > /home/vagrant/.ansible.cfg"
  config.vm.provision "shell", inline: "ls && id -a && pacman -Syu --noconfirm python ansible net-tools"
  # config.vm.provision "shell", privileged: false, inline: "ansible-galaxy collection install community.general"
  # config.vm.provision "shell", privileged: false, inline: "ansible-galaxy collection install kewlfft.aur"
  # if Vagrant::Util::Platform.windows?
    # didn't work anwyway
    #config.vm.provision "shell", inline: "chown -R vagrant /home/vagrant/.ansible && chgrp !* "
  # end

  # provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible
  # config.vm.provision provisioner do |ansible|
  #   ansible.playbook = "vagrant.yml"
  # end
  config.vm.provider "virtualbox" do |vbox|
    if USE_GUI
      vbox.memory = 4096
      vbox.cpus = 4
      vbox.gui = true
      config.disksize.size = "50GB"
    end
  end
end
