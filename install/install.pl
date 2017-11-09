#!/usr/bin/perl
use strict;
use warnings;
use autodie;

use File::Basename;
use File::Path;
use Cwd 'abs_path';
use Git::Repository;

use constant VUNDLE_URL => "https://github.com/VundleVim/Vundle.vim.git";

my $PROFILE_DIR = dirname(abs_path($0));

make_path(
    "$PROFILE_DIR/fonts",
    "$PROFILE_DIR/git/template/hooks",
    "$PROFILE_DIR/vim/tmp",
    "$PROFILE_DIR/vim/bundle",
    {verbose=>1}
);

symlink "$PROFILE_DIR/bash/login", "~/.bash_profile";
symlink "$PROFILE_DIR/bash/bashrc","~/.bashrc";
symlink "$PROFILE_DIR/git/config", "~/.gitconfig";
symlink "$PROFILE_DIR/inputrc",    "~/.inputrc";
symlink "$PROFILE_DIR/vim/vimrc",  "~/.vimrc";
symlink "$PROFILE_DIR/fonts",      "~/.fonts";

opendir my $hookDir, "$PROFILE_DIR/git/hooks"
    or dir "failed to open \"$PROFILE_DIR/git/hooks\": $!\n";

while (my $hookFile = readdir($hookDir)) {
    next if $file =~ m/^\./;
    symlink (
        "$PROFILE_DIR/git/hooks/$hookFile",
        "$PROFILE_DIR/git/template/hooks/$hookFile"
    );
}
closedir $hookDir;


exec("git config --global core.excludesfile $PROFILE_DIR/git/ignore");

Git::Repository->run( clone => VUNDLE_URL => "$PROFILE_DIR/vim/bundle");
Git::Repository->run( init => $PROFILE_DIR );
exec("vim +PluginInstall +qall")
