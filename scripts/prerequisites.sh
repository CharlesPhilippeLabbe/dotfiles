#!/bin/bash
sudo apt-get update
sudo apt-get install git btop tmux stow
sudo ./install_nvim.sh

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
