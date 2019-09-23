#!/bin/bash

# exit if any error
set -eo pipefail

# Check to make sure we are running as root
if [ "$EUID" -ne 0 ]
  then printf "\nPlease run as root\n\n"
  exit 1
fi

printf "\nBeginning install of operator-sdk...\n\n"

# get the version
VERSION=$(curl -L -s https://api.github.com/repos/operator-framework/operator-sdk/releases/latest | grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/" | grep -oE "[0-9]+[.][0-9]+[.][0-9]+")
printf "Getting latest version: v$VERSION\n\n"

# download binaries
curl -L -o /usr/local/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/v${VERSION}/operator-sdk-v${VERSION}-x86_64-linux-gnu

# make executable
printf "\nMake sure it's executable...\n\n"

chmod a+x /usr/local/bin/operator-sdk

echo "Install complete!"
