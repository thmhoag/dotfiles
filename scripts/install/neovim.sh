#!/usr/bin/env bash

set -eo pipefail

echo "removing if installed using apt..."
sudo apt-get remove neovim -y

NEOVIM_VERSION="$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

echo -e "Installing neovim ${NEOVIM_VERSION}..."

curl -sOL https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim.appimage
chmod a+rx nvim.appimage
./nvim.appimage --appimage-extract

sudo chmod 0755 ./squashfs-root
sudo cp -r squashfs-root/usr/. /usr/

rm -r squashfs-root/
rm -r nvim.appimage
