#!/usr/bin/env bash

set -eo pipefail

if [ "$EUID" -ne 0 ]; then
    # must run as root
    sudo "$0" "$@"
    exit
fi

VERSION=3.1

apt-get update
apt-get -y remove tmux
apt-get -y install git automake build-essential pkg-config libevent-dev libncurses5-dev

curl -LO https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz

tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz

cd tmux-${VERSION}
./configure

make
make install

cd -
rm -rf /usr/local/src/tmux-*
mv tmux-${VERSION} /usr/local/src

## Logout and login to the shell again and run.
## tmux -V
