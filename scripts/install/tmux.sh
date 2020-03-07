#!/usr/bin/env bash

set -eo pipefail

# Steps to build and install tmux from source on Ubuntu.
# Takes < 25 seconds on EC2 env [even on a low-end config instance].
VERSION=2.8

apt-get -y remove tmux
apt-get -y install wget tar libevent-dev libncurses-dev

wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz

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
