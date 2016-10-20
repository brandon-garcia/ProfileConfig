#!/bin/bash

function git_clone() {
    for $repo in $@; do
        if [ ! -d "$(dirname $repo)" ]; then
            git clone https://github.com/$repo
        fi
    done
}

ORIG_DIR="$(pwd)"
PROFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# make profile symlinks
ln -sf $PROFILE_DIR/bash/login        ~/.bash_profile
ln -sf $PROFILE_DIR/fonts             ~/.fonts
ln -sf $PROFILE_DIR/git/gitconfig     ~/.gitconfig
ln -sf $PROFILE_DIR/inputrc           ~/.inputrc
ln -sf $PROFILE_DIR/vim/vimrc         ~/.vimrc

# install gnome terminal color scheme
gconftool-2 --load $PROFILE_DIR/gnome-terminal-conf.xml

# install fonts
sudo fc-cache -fv

# install vim plugins
if [ ! -d "$PROFILE_DIR/vim/runtime/src" ]; then
    cd $PROFILE_DIR/vim/runtime
    mkdir tmp src
    cd src

    git_clone                           \
        jlanzarotta/bufexplorer.git     \
         scrooloose/nerdtree.git        \
              tpope/vim-commentary.git  \
         scrooloose/syntastic.git       \
           airblade/vim-gitgutter.git   \
           ctrlpvim/ctrlp.vim.git       \
        vim-airline/vim-airline.git     \
        vim-airline/vim-airline-themes  \
          godlygeek/tabular
fi

cd $ORIG_DIR
