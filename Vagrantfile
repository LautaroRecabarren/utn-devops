# -*- mode: ruby -*-
# vi: set ft=ruby :
LOCAL_IP = "10.0.0.20"

Vagrant.configure("2") do |config|
    config.vm.define "local-dev.utn-devops.int" do |subconfig|
        subconfig.vm.box = "ubuntu/bionic64"

        # Settings
        subconfig.vm.provider "virtualbox" do |v|
            v.name = "local-dev.utn-devops.int"
            v.memory = "1024"
        end
        subconfig.vm.hostname = "local-dev"
        subconfig.vm.network "forwarded_port", guest: 8081, host: 8081, guest_ip: LOCAL_IP, auto_correct: true
        subconfig.vm.network "forwarded_port", guest: 4400, host: 4400, guest_ip: LOCAL_IP, auto_correct: true
        subconfig.vm.network :private_network, ip: LOCAL_IP

        # Shared folder
        subconfig.vm.synced_folder ".", "/var/www/utn-devops-app"

        # Provision
        subconfig.vm.provision "file", source: "local_environment_configs/ufw", destination: "/tmp/ufw"
        subconfig.vm.provision "file", source: "local_environment_configs/etc_hosts.txt", destination: "/tmp/hosts"
        subconfig.vm.provision "file", source: "local_environment_configs/domain.crt", destination: "/tmp/domain.crt"
        subconfig.vm.provision "file", source: "docker-configs/config.json", destination: "/tmp/config.json"
        subconfig.vm.provision :shell, path: "Vagrant.local.bootstrap.sh"
        #
    end
  #
end
