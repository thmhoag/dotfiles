#!/usr/bin/env bash

set -eo pipefail

echo "Installing the latest version of butler from Itch.io..."
mkdir -p /tmp/butler
curl -sL -o /tmp/butler/butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
unzip -o -d /tmp/butler /tmp/butler/butler.zip

chmod a+rx /tmp/butler/butler
chmod a+r /tmp/butler/7z.so
chmod a+r /tmp/butler/libc7zip.so

echo "Moving to /usr/local/bin..."
sudo mv /tmp/butler/butler /usr/local/bin
sudo mv /tmp/butler/7z.so /usr/local/lib
sudo mv /tmp/butler/libc7zip.so /usr/local/lib

echo "Cleaning up..."
rm -r /tmp/butler

echo "butler $(butler -V) installed!"
