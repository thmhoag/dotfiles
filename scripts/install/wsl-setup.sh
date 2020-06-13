#!/usr/bin/env bash 

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

set -e

echo "Setting up /etc/wsl.conf to mount drive letters instead of /mnt"
cat << EOF > /etc/wsl.conf
# Enable extra metadata options by default
[automount]
enabled = true
root = /windir/
options = "metadata,umask=22,fmask=11"
mountFsTab = false

# Enable DNS – even though these are turned on by default, we’ll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true
EOF

printf "\n\nInstalling docker...\n\n"
apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update && apt-get install docker-ce -y

groupadd docker
usermod -aG docker $(logname)

printf "\n\nDownload and install docker-compose...\n\n"
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

export DOCKER_HOST=0.0.0.0:2375
echo "DOCKER_HOST=0.0.0.0:2375" >> $HOME/.bashrc


printf "\n\nInstalling kubectl...\n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubectl

printf "\n\nInstalling helm...\n"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash


printf "\n\n Installing nvm... \n"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

printf "\n\n Installing dotnet core\n"
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

apt-get install apt-transport-https
apt-get update
apt-get install dotnet-sdk-2.2 -y