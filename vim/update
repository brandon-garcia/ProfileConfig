#!/bin/bash

ORIG_DIR=$(pwd)

cd $PROFILE_DIR/vim/runtime/src
for d in $(ls)
do
	(cd $d && git pull)
done

cd $ORIG_DIR
