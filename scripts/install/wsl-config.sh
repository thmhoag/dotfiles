#!/usr/bin/env bash

set -eo pipefail

if [ "$EUID" -ne 0 ]; then
    # must run as root
    sudo WSL_DISTRO_NAME=$WSL_DISTRO_NAME "$0" "$@"
    exit
fi

[ -n "$WSL_DISTRO_NAME" ] || { echo "We are not in a WSL distro, aborting..." >&2; exit 1; }

cat << EOF > /etc/wsl.conf
# Enable extra metadata options by default
[automount]
enabled = true
root = /
options = "metadata,umask=22,fmask=11"
mountFsTab = true

# Enable DNS – even though these are turned on by default, we'll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true

[interop]
appendWindowsPath=true
EOF
