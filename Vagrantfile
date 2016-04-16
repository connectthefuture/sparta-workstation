# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Configure a Synched folder
  config.vm.synced_folder "./work", "/home/vagrant/work"

  # Forward port 3000 to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # WebBrick
  config.vm.network :forwarded_port, guest: 3306, host: 3306 # SQL

  # Move dotfiles over
  config.vm.provision "file", source: "config/dotfiles/.bash_profile", destination: ".bash_profile"
  config.vm.provision "file", source: "config/dotfiles/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "config/dotfiles/.irbrc", destination: ".irbrc"
  config.vm.provision "file", source: "config/dotfiles/.pryrc", destination: ".pryrc"
  config.vm.provision "file", source: "config/dotfiles/.vimrc", destination: ".vimrc"
  config.vm.provision "file", source: "config/dotfiles/.git_status_in_prompt.sh", destination: ".git_status_in_prompt.sh"

  # Run the provisioning script
  config.vm.provision "shell", path: "config/provision-root.sh", keep_color: true, privileged: true
  config.vm.provision "shell", path: "config/provision.sh", keep_color: true, privileged: false
end
