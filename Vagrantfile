Vagrant.configure("2") do |config|
  config.vm.box = "terrywang/archlinux"

  config.vm.network "private_network", ip: "172.28.128.100"
  config.vm.synced_folder "./", "/home/vagrant/workstation-config/"

 # config.vm.provision "shell", inline: "ls && id -a && pacman -Sy --noconfirm python"
 # config.vm.provision "shell", inline: "pacman -S net-tools --noconfirm"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "vagrant.yml"
  end
  config.vm.provider "virtualbox" do |vbox|
    #vbox.gui = true
  end
end
