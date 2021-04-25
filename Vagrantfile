Vagrant.configure("2") do |config|
  config.vm.box = "generic/arch"

  config.vm.synced_folder "./", "/home/vagrant/workstation-config/", type: "rsync"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "main.yml"
  end
end
