#!/bin/bash

ORIG_DIR="$(pwd)"

cd $PROFILE_DIR/vim/runtime
mkdir tmp
mkdir src
cd src

git clone https://github.com/jlanzarotta/bufexplorer.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes

cd $ORIG_DIR
