#!/usr/bin/env bash

set -eo pipefail

KUBECTL_VERSION="$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)"

echo "Installing kubectl $KUBECTL_VERSION..."

curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo -e "\n\n"
kubectl version --client
