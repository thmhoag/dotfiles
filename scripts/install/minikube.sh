#!/usr/bin/env bash

set -eo pipefail

echo "Installing latest version of minikube..."
curl -sLO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo "Cleaning up..."
rm minikube-linux-amd64
echo "Installation complete!"
