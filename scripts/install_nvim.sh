#!/bin/bash
cd "$(dirname "$0")"
source ./lib.sh

if is_arch; then
    pkg_install neovim
    exit 0
fi

case "$(uname -m)" in
    x86_64) VERSION=nvim-linux-x86_64 ;;
    aarch64) VERSION=nvim-linux-arm64 ;;
    *) echo "unsupported arch" >&2; exit 1 ;;
esac
VERSION_EXT=$VERSION.tar.gz
wget "https://github.com/neovim/neovim/releases/latest/download/$VERSION_EXT"
$SUDO tar -zxf "$VERSION_EXT" -C /usr/share
rm -f "$VERSION_EXT"
$SUDO rm -f /usr/bin/nvim
$SUDO ln -s "/usr/share/$VERSION/bin/nvim" /usr/bin/nvim
