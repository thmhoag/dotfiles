#!/usr/bin/env bash

set -eo pipefail

## https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz
VERSION="$(curl -s https://api.github.com/repos/gorcon/rcon-cli/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')"

echo -e "installing rcon-cli ${VERSION}..."

mkdir -p /tmp/rcon-cli_linux_amd64
curl -sL https://github.com/gorcon/rcon-cli/releases/download/v${VERSION}/rcon-${VERSION}-amd64_linux.tar.gz | tar xz -C /tmp/rcon-cli_linux_amd64
chmod a+rx /tmp/rcon-cli_linux_amd64/rcon-${VERSION}-amd64_linux/rcon

sudo mv /tmp/rcon-cli_linux_amd64/rcon-${VERSION}-amd64_linux/rcon /usr/local/bin
rm -rf /tmp/rcon-cli_linux_amd64
