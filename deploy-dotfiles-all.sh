#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

#ln -s ~/Dropbox/work/database ~/database
#ln -s ~/Dropbox/work/svn ~/svn
#ln -s ~/Dropbox/work/github ~/github
#ln -s ~/Dropbox/work/github/dotfiles ~/github/dotfiles
#
porcelain
