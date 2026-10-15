#!/bin/bash
cd "$(dirname "$0")"
source ./lib.sh

if is_arch; then
    # Omarchy ships most of these; --needed skips what is present
    pkg_install git btop tmux stow fzf ripgrep neovim
else
    pkg_install git btop tmux stow fzf curl wget
    ./install_nvim.sh

    if ! command -v rg >/dev/null; then
        deb="ripgrep_14.1.0-1_$(deb_arch).deb"
        curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/$deb"
        $SUDO dpkg -i "$deb"
        rm -f "$deb"
    fi
fi
