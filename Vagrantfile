Vagrant.configure("2") do |config|
  config.vm.box = "generic/arch"

  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder "./", "/home/vagrant/workstation-config/"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "main.yml"
  end
end
