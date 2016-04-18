#!/usr/bin/env bash

TARGET_DIR=~/.vim/plugged/vim-auto-plug
git clone --recursive https://github.com/vimx/vim-auto-plug $TARGET_DIR

vim +PlugInstall +qall
