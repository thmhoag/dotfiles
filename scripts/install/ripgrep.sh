#!/usr/bin/env bash

set -eo pipefail

RIPGREP_VERSION="$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

echo -e "Installing ripgrep $RIPGREP_VERSION\n\n\n"

curl -sLO https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_amd64.deb

sudo dpkg --force-overwrite -i ripgrep*.deb

rm ripgrep*.deb
