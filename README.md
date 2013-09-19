# Initial Setup

## dotfiles & vim 

```
mkdir ~/.dotfiles &&  cd ~/.dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./setup.sh
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

## LiveStyle build

brew install go mercurial
cd ~/.vim/bundle/livestyle-vim/livestyled
go get code.google.com/p/go.net/websocket
go build livestyled.go

## Macのtmuxでクリップボード機能を有効にするために必要

```
brew install reattach-to-user-namespace
```
