#!/bin/bash
cd $(dirname $0)
DEBIAN_FRONTEND=noninteractive apt update && apt install -y git btop tmux stow
./install_nvim.sh

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
dpkg -i ripgrep_14.1.0-1_amd64.deb
