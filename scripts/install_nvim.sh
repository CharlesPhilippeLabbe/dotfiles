#!/bin/bash
VERSION=nvim-linux-x86_64
VERSION_EXT=$VERSION.tar.gz
wget https://github.com/neovim/neovim/releases/latest/download/$VERSION_EXT
tar -zxf $VERSION_EXT /usr/share/$VERSION
rm /usr/bin/nvim
ln -s /usr/share/$VERSION/bin/nvim /usr/bin/nvim
