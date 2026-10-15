#!/bin/bash
# usage: install_coretto.sh <major version, e.g. 17>
cd "$(dirname "$0")"
source ./lib.sh

VERSION=$1
if [ -z "$VERSION" ]; then
    echo "usage: $0 <version>" >&2
    exit 1
fi

if is_arch; then
    pkg_install "jdk${VERSION}-openjdk"
    exit 0
fi

case "$(uname -m)" in
    x86_64) ARCH="x64" ;;
    aarch64) ARCH="aarch64" ;;
    *) echo "unsupported arch" >&2; exit 1 ;;
esac
RESOURCE="amazon-corretto-$VERSION-$ARCH-linux-jdk.deb"

pkg_install java-common wget
wget "https://corretto.aws/downloads/latest/$RESOURCE"
$SUDO dpkg --install "$RESOURCE"
rm -f "$RESOURCE"
