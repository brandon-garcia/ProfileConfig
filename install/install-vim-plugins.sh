#!/bin/bash

function git_clone() {
	for repo in $@; do
		repo_dir=${repo##*/}
		repo_dir=${repo_dir%.git}
		if [ ! -d "$repo_dir" ]; then
			git clone https://github.com/${repo}.git
		fi
	done
}

ORIG_DIR="$(pwd)"
export PROFILE_DIR="$(dirname "$(dirname "$(readlink -f ~/.bash_profile)")")"
export PATH="$PROFILE_DIR/bin:$PATH"

# install vim plugins
cd $PROFILE_DIR/vim/runtime/src

git_clone                          \
	jlanzarotta/bufexplorer        \
	scrooloose/nerdtree            \
	tpope/vim-commentary           \
	scrooloose/syntastic           \
	airblade/vim-gitgutter         \
	ctrlpvim/ctrlp.vim             \
	vim-airline/vim-airline        \
	vim-airline/vim-airline-themes \
	godlygeek/tabular              \
	tpope/vim-fugitive

cd $ORIG_DIR;
