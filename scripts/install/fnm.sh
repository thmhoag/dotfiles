#!/usr/bin/env bash

set -eo pipefail

curl -fsSL https://fnm.vercel.app/install | sudo bash -s -- --install-dir "/usr/local/bin" --skip-shell
sudo chmod a+rx /usr/local/bin/fnm
