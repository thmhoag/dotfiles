#!/usr/bin/env bash

set -eo pipefail


NEOVIM_VERSION="$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

echo -c "Installing neovim ${NEOVIM_VERSION}..."

curl -sOL https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz

sudo cp nvim-linux64/bin /usr
sudo cp nvim-linux64/share /usr

rm -r nvim-linux64/
