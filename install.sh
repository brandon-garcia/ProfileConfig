#!/bin/bash
export PROFILE_DIR=$(pwd)

sudo apt-get install \
    git \
    cpan \
    vim \
    expect

sudo cpan install \
    File::KeePass \
    File::Basename \
    File::Path \
    Cwd \
    Git::Repository \
    Getopt::Long \

perl $PROFILE_DIR/install/install.pl
