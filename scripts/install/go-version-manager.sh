#!/usr/bin/env bash

set -eo pipefail

echo "Installing gvm dependencies, more info at: https://github.com/moovweb/gvm"
sudo apt-get update
sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
