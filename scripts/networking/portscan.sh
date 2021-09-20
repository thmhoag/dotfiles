#!/usr/bin/env bash

set -eo pipefail

# Check for valid input
[ -z "$1" ] && printf "Must provide an IP address to scan.\n" && exit 1

hostname=$1

echo "Scanning $hostname..."

for port in {1..65535}; do
    2>/dev/null echo > /dev/tcp/$hostname/$port
    if [ $? == 0 ]; then
        echo " $port is open"
    fi
done
