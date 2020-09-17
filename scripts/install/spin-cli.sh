#!/usr/bin/env bash

set -eo pipefail

LATEST_VERSION=$(curl -s https://storage.googleapis.com/spinnaker-artifacts/spin/latest)

printf "\n\nInstalling Spinnaker (spin) cli version $LATEST_VERSION...\n\n"
curl -sLO https://storage.googleapis.com/spinnaker-artifacts/spin/${LATEST_VERSION}/linux/amd64/spin

chmod +x ./spin
sudo mv ./spin /usr/local/bin/spin

echo -e "\n\n"
echo "Complete"
