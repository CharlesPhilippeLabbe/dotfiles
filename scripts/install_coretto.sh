#!/bin/bash
sudo apt-get update && sudo apt-get install java-common
#https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb
#ARCH=aarch64
VERSION=11
ARCH="x64"
RESOURCE="amazon-corretto-$VERSION-$ARCH-linux-jdk.deb"

wget https://corretto.aws/downloads/latest/$RESOURCE
sudo dpkg --install $RESOURCE

