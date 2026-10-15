#!/bin/bash
# Shared helpers. Source, don't execute.

if [ -r /etc/os-release ]; then
    . /etc/os-release
fi

is_arch() { [[ "$ID" == "arch" || "$ID" == "omarchy" || "$ID_LIKE" == *arch* ]]; }
is_debian() { [[ "$ID" == "debian" || "$ID" == "ubuntu" || "$ID_LIKE" == *debian* ]]; }

SUDO=""
[ "$(id -u)" -ne 0 ] && SUDO="sudo"

# pkg_install <package>...  (Debian package names; mapped for Arch where they differ)
pkg_install() {
    if is_arch; then
        $SUDO pacman -S --needed --noconfirm "$@"
    elif is_debian; then
        $SUDO apt-get update
        $SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y "$@"
    else
        echo "unsupported distro: $ID" >&2
        return 1
    fi
}

# deb_arch -> amd64/arm64 ; uname_arch -> x86_64/aarch64
uname_arch() { uname -m; }
deb_arch() { case "$(uname -m)" in x86_64) echo amd64 ;; aarch64) echo arm64 ;; *) uname -m ;; esac; }
