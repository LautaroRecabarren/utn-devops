Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "utn-devops"
  config.vm.network "forwarded_port", guest: 8080, host: 8082, auto_correct: true
  config.vm.provider "virtualbox" do |vb|
    vb.name   = "utn-devops"
    vb.cpus   = 2
    vb.memory = 4096
  end
  config.vm.provision "shell", path: "Vagrant.bootstrap.sh"
end
