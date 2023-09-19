#!/usr/bin/env bash

set -eo pipefail

VERSION=$(curl -L -s https://api.github.com/repos/argoproj/argo-workflows/releases/latest | grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/" | grep -oE "[0-9]+[.][0-9]+[.][0-9]+")

echo -e "installing argo ${VERSION}..."

curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v${VERSION}/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz

chmod a+x argo-linux-amd64
sudo mv ./argo-linux-amd64 /usr/local/bin/argo

echo "argo installed"
