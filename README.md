

## Setup ssh key 

~~~
$ mkdir .ssh
$ ln -s ~/Dropbox/work/setting/ssh/\* .ssh/  #  or scp ~/Dropbox/work/setting/ssh/id_rsa XXX@REMOTE-IP:/home/XXXX/.ssh
$ chmod 600 ~/.ssh/config
$ chmod 600 ~/.ssh/id\_\*
~~~


## Setup dotfiles

~~~
$ mkdir ~/.dotfiles &&  cd ~/.dotfiles
$ git clone git@github.com:syotaro/dotfiles.git .
$ sh ./setup.sh
~~~

## Configure osx

~~~
$ cd ~/.dotfiles
$ sh ./osx.sh
~~~

## Install Application via AppStore

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


## Install Application via homebrew

- [Homebrew で作るモダンなフロントエンド開発環境 (Git + zsh + apache + MySQL + Ruby) ｜ Developers.IO](http://dev.classmethod.jp/etc/modern-dev-environment-by-homebrew/)
- [Mac - パッケージ管理システム Homebrew - Qiita](http://qiita.com/b4b4r07/items/6efebc2f3d1cbbd393fc)

### Install Require Tools

- Java

  ~~~
  $ java -version
  ~~~

- Xcode Command Line Tools

### Install

~~~
$ ruby     -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
$ brew    doctor
$ brew    update
$ cd      ~/.dotfiles
$ gem     install brewdler
$ brew    tap 'homebrew/dupes'
$ brew    tap 'josegonzalez/homebrew-php'
$ brew    tap 'phinze/homebrew-cask'
$ brew    install brew-cask
$ brewdle install
~~~

## Install PHP via php-build

~~~
$ php-build --definitions
$ php-build 5.3.20 ~/.phpenv/versions/5.3.20
$ phpenv global 5.2.17
$ phpenv version
$ phpenv rehash
$ php -v
~~~

## Install pandoc via Haskell-Platform

~~~
$ cabal update
$ cabal install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
~~~

## Change shell(bash -> zsh)

~~~
$ chsh -s /bin/zsh 
$ cat /etc/shells
~~~

## Add QuickLook Plugin

~~~
$ mkdir ~/Library/QuickLook/
$ cp -r ~/.dotfiles/quicklook/\* ~/Library/QuickLook
$ killall Finder
~~~

## Install gem-Applicagion via ruby-gem

~~~
$ gem install bundler
$ rbenv rehash
$ bundle install
~~~

## Configure vim & install vim plugin

~~~
$ vim
//  mkdir -p ~/.vim/bundle
//  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ cd ~/.vim/bundle/neosnippet
$ git update-index --assume-unchanged autoload/neosnippet/snippets/php.snip
~~~

## Build LiveStyle

~~~
$ cd ~/.vim/bundle/livestyle-vim/livestyled
$ go get code.google.com/p/go.net/websocket
$ go build livestyled.go
~~~

## Vim

### Gist-vim

~~~
vim ~/.gist-vim   // => set token
chmod 600 ~/.gist-vim
~~~

## Bower

- [BOWER: A package manager for the web](http://bower.io/)
- [GruntとBowerを使ってWeb開発用のテンプレートを作成する - タチコマ好きなエンジニアのブログ](http://yukihir0.hatenablog.jp/entry/2013/08/06/224722)
- [Bower入門(基礎編) - from scratch](http://yosuke-furukawa.hatenablog.com/entry/2013/06/01/173308)

~~~
$ brew install node.js
$ npm install -g bower
~~~




