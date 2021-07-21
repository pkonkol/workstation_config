Vagrant.configure("2") do |config|
  config.vm.box = "terrywang/archlinux"

  config.vm.network "private_network", ip: "172.28.128.100"
  config.vm.synced_folder "./", "/home/vagrant/workstation-config/"

#  config.vm.provision "shell", inline: "ls && id -a && pacman -Sy --noconfirm python"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "vagrant.yml"
  end
end
