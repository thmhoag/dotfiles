#!/usr/bin/env bash

set -eo pipefail

VERSION="$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
echo -e "installing k9s ${VERSION}..."

mkdir -p /tmp/k9s_Linux_x86_64
curl -sL https://github.com/derailed/k9s/releases/download/${VERSION}/k9s_Linux_x86_64.tar.gz | tar xz -C /tmp/k9s_Linux_x86_64
chmod a+rx /tmp/k9s_Linux_x86_64/k9s

sudo mv /tmp/k9s_Linux_x86_64/k9s /usr/local/bin
rm -rf /tmp/k9s_Linux_x86_64
