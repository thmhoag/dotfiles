#!/usr/bin/env bash

set -eo pipefail

VERSION=$(curl -L -s https://api.github.com/repos/nektos/act/releases/latest | grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/" | grep -oE "[0-9]+[.][0-9]+[.][0-9]+")

echo -e "installing act ${VERSION}..."

mkdir -p /tmp/act_Linux_x86_64
curl -sL https://github.com/nektos/act/releases/download/v${VERSION}/act_Linux_x86_64.tar.gz | tar xz -C /tmp/act_Linux_x86_64
chmod a+rx /tmp/act_Linux_x86_64/act

sudo mv /tmp/act_Linux_x86_64/act /usr/local/bin
rm -rf /tmp/act_Linux_x86_64

echo "act installed"
