#!/usr/bin/env bash

set -eo pipefail

VERSION="$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
echo -e "installing lazygit ${VERSION}..."

mkdir -p /tmp/lazygit_Linux_amd64
curl -sL https://github.com/jesseduffield/lazygit/releases/download/${VERSION}/lazygit_${VERSION:1}_Linux_32-bit.tar.gz | tar xz -C /tmp/lazygit_Linux_amd64
chmod a+rx /tmp/lazygit_Linux_amd64/lazygit

sudo mv /tmp/lazygit_Linux_amd64/lazygit /usr/local/bin
rm -rf /tmp/lazygit_Linux_amd64
