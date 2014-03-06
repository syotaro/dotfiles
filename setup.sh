#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

ln -sf ~/Dropbox/work/database ~/database
ln -sf ~/Dropbox/work/svn ~/svn
ln -sf ~/Dropbox/work/github ~/github
ln -sf ~/Dropbox/work/github/dotfiles ~/github/dotfiles

