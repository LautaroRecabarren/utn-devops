Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "utn-devops-u2"
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  config.vm.provision "shell", path: "Vagrant.bootstrap.sh"
end
