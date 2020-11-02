#!/usr/bin/env bash

set -eo pipefail

echo -e "Installing Istio 1.7.4 ...\n\n"

curl -sL https://istio.io/downloadIstio | ISTIO_VERSION=1.7.4 sh -

echo "Adding to /usr/local/bin ..."
sudo ln -sf $HOME/istio-1.7.4/bin/istioctl /usr/local/bin/istioctl
