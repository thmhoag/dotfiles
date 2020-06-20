#!/usr/bin/env bash

set -eo pipefail

VERSION="$(curl -s https://api.github.com/repos/vmware-tanzu/velero/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
echo -e "installing velero ${VERSION}..."

mkdir -p /tmp/velero-${VERSION}-linux-amd64
curl -sL https://github.com/vmware-tanzu/velero/releases/download/${VERSION}/velero-${VERSION}-linux-amd64.tar.gz | tar xz -C /tmp/velero-${VERSION}-linux-amd64
chmod a+rx /tmp/velero-${VERSION}-linux-amd64/velero-${VERSION}-linux-amd64/velero

sudo mv /tmp/velero-${VERSION}-linux-amd64/velero-${VERSION}-linux-amd64/velero /usr/local/bin
rm -rf /tmp/velero-${VERSION}-linux-amd64/
