#!/bin/bash
cd "$(dirname "$0")"
source ./lib.sh

if is_arch; then
    pkg_install aws-cli-v2
    exit 0
fi

ARCH="$(uname_arch)"
RESOURCE="awscli-exe-linux-$ARCH.zip"
pkg_install curl unzip
curl "https://awscli.amazonaws.com/$RESOURCE" -o "awscliv2.zip"
unzip -q awscliv2.zip
$SUDO ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm awscliv2.zip
rm -rf ./aws
