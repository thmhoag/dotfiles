#!/usr/bin/env bash

set -eo pipefail

VERSION="$(curl -s https://api.github.com/repos/skeema/skeema/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
echo -e "installing skeema ${VERSION}..."

mkdir -p /tmp/skeema_Linux_x86_64
curl -sLO https://github.com/skeema/skeema/releases/download/${VERSION}/skeema_amd64.deb


sudo dpkg --force-overwrite -i skeema*.deb

rm skeema*.deb
