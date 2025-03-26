#!/bin/bash
ARCH="x86_64"
RESOURCE="awscli-exe-linux-$ARCH.zip"
curl "https://awscli.amazonaws.com/$RESOURCE" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm awscliv2.zip
rm -rf ./aws
