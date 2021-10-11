#!/usr/bin/env bash

set -eo pipefail

VERSION_TO_INSTALL="1.10.5"

echo -e "Installing Istio $VERSION_TO_INSTALL ...\n\n"

curl -sL https://istio.io/downloadIstio | ISTIO_VERSION="$VERSION_TO_INSTALL" sh -

echo "Adding to /usr/local/bin ..."
sudo ln -sf $HOME/istio-$VERSION_TO_INSTALL/bin/istioctl /usr/local/bin/istioctl
