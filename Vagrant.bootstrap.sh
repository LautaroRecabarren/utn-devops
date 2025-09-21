#!/usr/bin/env bash
set -e

sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release git rsync

if ! grep -q "utn-devops.localhost" /etc/hosts; then
  echo "127.0.1.1 utn-devops.localhost utn-devops" | sudo tee -a /etc/hosts >/dev/null
  sudo hostnamectl set-hostname utn-devops
fi

wget -q https://apt.puppet.com/puppet7-release-jammy.deb -O /tmp/puppet7-release.deb
sudo dpkg -i /tmp/puppet7-release.deb
sudo apt-get update -y
sudo apt-get install -y puppetserver puppet-agent

getent group puppet >/dev/null 2>&1 || sudo groupadd --system puppet
id -u puppet >/dev/null 2>&1 || sudo useradd --system --gid puppet --home /opt/puppetlabs/server/data/puppetserver puppet || true

if [ -f /etc/default/puppetserver ]; then
  sudo sed -i 's/Xms[0-9]*[mg]/Xms512m/g; s/Xmx[0-9]*[mg]/Xmx512m/g' /etc/default/puppetserver || true
fi

sudo mkdir -p /etc/puppetlabs/code/environments/production
sudo rsync -a --delete /vagrant/hostConfigs/puppet/ /etc/puppetlabs/code/environments/production/

if [ -f /vagrant/hostConfigs/puppet/puppet.conf ]; then
  sudo mkdir -p /etc/puppetlabs/puppet
  sudo cp /vagrant/hostConfigs/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
fi

sudo chown -R puppet:puppet /etc/puppetlabs || true

sudo systemctl enable --now systemd-timesyncd
sudo systemctl enable --now puppetserver
sudo systemctl enable --now puppet
