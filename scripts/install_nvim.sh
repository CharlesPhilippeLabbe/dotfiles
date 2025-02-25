#!/bin/bash
VERSION=nvim-linux-x86_64
VERSION_EXT=$VERSION.tar.gz
wget https://github.com/neovim/neovim/releases/latest/download/$VERSION_EXT
sudo tar -zxf $VERSION_EXT /usr/share/$VERSION
sudo rm /usr/bin/nvim
sudo ln -s /usr/share/$VERSION/bin/nvim /usr/bin/nvim
