#!/usr/bin/env bash

set -eo pipefail

echo -e "installing helmenv...\n\n"

rm -rf $HOME/.helmenv
git clone https://github.com/yuya-takeyama/helmenv.git $HOME/.helmenv
