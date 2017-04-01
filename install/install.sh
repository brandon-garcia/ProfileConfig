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

export PROFILE_DIR="$( cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd )"

export PATH="$PROFILE_DIR/bin:$PATH"

/bin/bash "$PROFILE_DIR/install/update-paths.sh"
/bin/bash "$PROFILE_DIR/install/install-vim-plugins.sh"
gconftool-2 --load $PROFILE_DIR/gnome-terminal-conf.xml

cd $PROFILE_DIR
git init
cd $ORIG_DIR
