#!/usr/bin/env bash

set -eo pipefail

VERSION=$(curl -L -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/" | grep -oE "[0-9]+[.][0-9]+[.][0-9]+")

echo -e "installing bat ${VERSION}..."

curl -sOL https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat-musl_${VERSION}_amd64.deb
sudo dpkg --force-overwrite -i bat-musl_${VERSION}_amd64.deb
rm bat-musl_${VERSION}_amd64.deb
