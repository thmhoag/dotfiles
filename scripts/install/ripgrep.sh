#!/usr/bin/env bash

set -eo pipefail

apt-get download ripgrep

sudo dpkg --force-overwrite -i ripgrep*.deb
