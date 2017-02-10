#!/bin/bash

PROFILE_DIR="$(dirname "$(dirname "$(readlink -f ~/.bash_profile)")")"
PATH="$PROFILE_DIR/bin:$PATH"

mkdir -p "$PROFILE_DIR/fonts"
mkdir -p "$PROFILE_DIR/git/template/hooks"
mkdir -p "$PROFILE_DIR/vim/runtime/tmp"
mkdir -p "$PROFILE_DIR/vim/runtime/src"

# make profile symlinks
ln -sf "$PROFILE_DIR/bash/login"  ~/.bash_profile
ln -sf "$PROFILE_DIR/bash/bashrc" ~/.bashrc
ln -sf "$PROFILE_DIR/git/config"  ~/.gitconfig
ln -sf "$PROFILE_DIR/inputrc"     ~/.inputrc
ln -sf "$PROFILE_DIR/vim/vimrc"   ~/.vimrc
ln -sf "$PROFILE_DIR/fonts"       ~/.fonts

git config --global core.excludesfile $PROFILE_DIR/git/ignore

for hook in $(ls "$PROFILE_DIR/git/hooks")
do
	ln -sf "$PROFILE_DIR/git/hooks/$hook" "$PROFILE_DIR/git/template/hooks/$hook"
done
