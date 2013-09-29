

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

## Install Application via App Store

~~~
$ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
1Password
AWS Menu Bar
App Language Chooser
CloudPlay
CodeRunner
ColorSchemer Studio
Dash
DeskConnect
Desktop Calendar Plus
Elastics
Evernote
Frank DeLoupe
GarageBand
Gemini
Gistify
GraphicConverter
GraphicalHttpClient
Gyazo
Handheld Designer
Hexels
Hype2
Infographics
JPEGmini
Jsonformatter
Keynote
LiveReload
MailTab Pro for Gmail
Markdown Pro
Market Junkie
MenuTab Pro for Facebook
Murasaki
Navicat Data Modeler
Navicat Premium Essentials
Navicat for MySQL
Numbers
OmniGraffle Professional 5
OmniGraphSketcher
PDF Reader
PDF2Office for OmniGraffle
PNG Compressor
PageLayers
Pages
PaintCode
Particle Playground
Patterns
Pixelmator
Rested
RocketDocs
Skitch
Slicy
Softmatic ScreenLayers
Softmatic WebLayers
SoraAnnai
Soulver
Sparrow
Stills
StockSpy
StockTouch
Templates for Office Pro
The Archive Browser
Translate Tab
Tuba
Unclutter
Visits
WebCode
WhiteNoise
WiFi Explorer
WinArchiver
Witch
Xcode
iKeyboard
iMovie
iPhoto
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
$ mkdir ~/Library/QuickLook/
$ cp -r ~/.dotfiles/quicklook/* ~/Library/QuickLook
$ killall Finder
~~~

## Install ruby-gem

~~~
$ gem install bundler
$ rbenv rehash
$ bundle install
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

