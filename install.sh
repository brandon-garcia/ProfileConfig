#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

PROFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PATH="$PROFILE_DIR/bin:$PATH"

mkdir -p $PROFILE_DIR/fonts
mkdir -p $PROFILE_DIR/git/template/hooks
mkdir -p $PROFILE_DIR/vim/tmp
mkdir -p $PROFILE_DIR/vim/bundle

ln -sf $PROFILE_DIR/bash/login ~/.bash_profile
ln -sf $PROFILE_DIR/bash/bashrc ~/.bashrc
ln -sf $PROFILE_DIR/git/config ~/.gitconfig
ln -sf $PROFILE_DIR/inputrc ~/.inputrc
ln -sf $PROFILE_DIR/vim/vimrc ~/.vimrc
ln -sf $PROFILE_DIR/fonts ~/.fonts

for hook in $( cd $PROFILE_DIR/git/hooks ; ls ); do
    ln -sf $PROFILE_DIR/git/hooks/$hook $PROFILE_DIR/git/template/hooks/$hook
done

git config --global core.excludesfile $PROFILE_DIR/git/ignore
git init

git clone https://github.com/VundleVim/Vundle.vim.git $PROFILE_DIR/vim/bundle/Vundle.vim
vim +PluginInstall +qall

