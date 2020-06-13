#!/usr/bin/env bash

set -eo pipefail

if [ "$EUID" -ne 0 ]; then
    # must run as root
    sudo "$0" "$@"
    exit
fi

apt-get update
apt-get install bat -y

ln -sf /usr/bin/batcat /usr/local/bin/bat
