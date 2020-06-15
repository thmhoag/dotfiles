#!/usr/bin/env bash

# exit if any error
set -eo pipefail

echo "Beginning install of kubebuilder..."

# Determine OS
OS="$(uname)"
case $OS in
  Darwin)
    OSEXT="darwin"
    ;;
  Linux)
    OSEXT="linux"
    ;;
  *)
    echo "Only OSX and Linux OS are supported !"
    exit 1
    ;;
esac

HW=$(uname -m)
case $HW in
    x86_64)
      ARCH=amd64 ;;
    *)
      echo "Only x86_64 machines are supported !"
      exit 1
      ;;
esac

VERSION=$(curl -L -s https://api.github.com/repos/kubernetes-sigs/kubebuilder/releases/latest | grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/" | grep -oE "[0-9]+[.][0-9]+[.][0-9]+")

echo "OS: $OSEXT"
echo "ARCH: $ARCH"
echo "VERSION: $VERSION"

# download kubebuilder and extract it to tmp
curl -sL https://go.kubebuilder.io/dl/$VERSION/$OSEXT/$ARCH | tar -xz -C /tmp/

# move to a long-term location and put it on your path
# (you'll need to set the KUBEBUILDER_ASSETS env var if you put it somewhere else)
sudo mv /tmp/kubebuilder_${VERSION}_${OSEXT}_${ARCH}/bin/kubebuilder /usr/local/bin/
rm -rf /tmp/kubebuilder_${VERSION}_${OSEXT}_${ARCH}

cat << EOF
Make sure to add the following to your path in your bashrc or otherwise:

    export PATH=\$PATH:/usr/local/kubebuilder/bin

Installation complete!
EOF
