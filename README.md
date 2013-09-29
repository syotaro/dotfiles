

## Setup ssh key 

~~~
mkdir .ssh
ln -s ~/Dropbox/work/setting/ssh/* .ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
~~~


## Setup dotfiles

~~~
mkdir ~/.dotfiles &&  cd ~/.dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./setup.sh
~~~

## Configure osx

~~~
cd ~/.dotfiles
sh ./osx.sh
~~~

## Install homebrew

- require
  - requiire Xcode Command Line Tools

~~~
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
cd ~/.dotfiles
gem install brewdler
brew tap homebrew/dupes
brew tap  'josegonzalez/homebrew-php'
brewdle install
~~~

## Change shell(bash -> zsh)

~~~
$ chsh -s /bin/zsh 
~~~

## Add QuickLook Plugin

~~~
/Users/shotaro.yamamoto/Dropbox/work/setting/quicklook
mkdir ~/Library/QuickLook/
cp -r ~/.dotfiles/quicklook/* ~/Library/QuickLook
killall Finder
~~~

## Install ruby-gem

~~~
~~~

## Configure vim & install vim plugin

~~~
vim
//  mkdir -p ~/.vim/bundle
//  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
~~~

## Build LiveStyle

~~~
brew install go mercurial
cd ~/.vim/bundle/livestyle-vim/livestyled
go get code.google.com/p/go.net/websocket
go build livestyled.go
~~~

