#!/usr/bin/env bash

set -eo pipefail

if [ "$EUID" -ne 0 ]; then
    # must run as root
    sudo WSL_DISTRO_NAME=$WSL_DISTRO_NAME LOGNAME=$LOGNAME "$0" "$@"
    exit
fi

printf "\n\nInstalling docker...\n\n"
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg-agent \
    software-properties-common


if [[ -n "$WSL_DISTRO_NAME" ]] && [[ "$(lsb_release -cs)" = "focal" ]]; then
    # this is a temporary hack to fix gpg in Ubuntu 20.04 for WSL1 only
    echo "installing temporary hack for Ubuntu 20.04 on WSL1..."
    wget https://launchpad.net/~rafaeldtinoco/+archive/ubuntu/lp1871129/+files/libc6_2.31-0ubuntu8+lp1871129~1_amd64.deb
    dpkg --install libc6_2.31-0ubuntu8+lp1871129~1_amd64.deb
    apt-mark hold libc6 #to avoid further update
    rm libc6_2.31-0ubuntu8+lp1871129~1_amd64.deb
fi

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install docker-ce -y

DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
printf "\n\nDownload and install docker-compose version ${DOCKER_COMPOSE_VERSION}...\n\n"
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

groupadd -f docker
usermod -aG docker "$LOGNAME"

echo "Complete"
