
## OS X setup flow

### Setup ssh key 

~~~bash
mkdir ~/.ssh
ln -s ~/Dropbox/work/setting/ssh/*
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
~~~

### Setup dotfiles

~~~bash
mkdir ~/.dotfiles &&  cd ~/.dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./setup.sh
~~~

### Configure OS X

~~~bash
cd ~/.dotfiles
sh ./osx.sh
~~~

### Install Apps (via AppStore)

~~~bash
    # => manually thins
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


### Install Apps (via homebrew)

- [Homebrew で作るモダンなフロントエンド開発環境 (Git + zsh + apache + MySQL + Ruby) ｜ Developers.IO](http://dev.classmethod.jp/etc/modern-dev-environment-by-homebrew/)
- [Mac - パッケージ管理システム Homebrew - Qiita](http://qiita.com/b4b4r07/items/6efebc2f3d1cbbd393fc)

~~~bash
    # Install Require Tools
java -version                # => Install manually java
open /Applications/Xcode.app # => Install manually Xcode Command Line Tools
~~~
~~~bash
    # Install
ruby    -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew    doctor
brew    update
gem     install brewdler
brew    tap 'homebrew/dupes'
brew    tap 'josegonzalez/homebrew-php'
brew    tap 'phinze/homebrew-cask'
brew    install brew-cask
cd      ~/.dotfiles
cat     brewfile
brewdle install
~~~

### Install Apps (ohter than via AppStore$)

~~~bash
diff -y <(mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ;}' | sort) <( ls /Applications| grep '.app' | sort) | grep '>' | awk '{for( i = 2; i < NF; i++ ){printf( "%s ", $i );}print $NF;}' | awk '{sub(".app","")}{print}' | egrep -v 'Safari|iTune|Time Machine|Mail|Reminders|QuickTime|Preview|Photo Booth|Notes|App Store|Automator|Calculator|Dictionary|Dashboard|DVD Player|FaceTime|Game Center|Image Capture|Messages|Mission Control|Calendar|Chess|Contacts|Launchpad'

AirPlayit
Alfred 2
AppCleaner
AppStoreHelper
Bartender
BetterTouchTool
Brackets Sprint 24
Camtasia 2
Dropbox
Elasticfox
Font Book
FontForge
ForkLift
Gifzo
Google Chrome Canary
Google Chrome
GraffitiPot
IAMFox
ItunesIcon
KeyRemap4MacBook
LevelHelper PRO
LibreOffice
Line
Lively Logic
MPlayerX
MacPilot
MacVim
Magican
Mangao
Mobile Partner
OmniGraffle
OmniPresence
ParticleDesigner
Path Finder
Python Launcher 3
QuickCast
R53Fox
Reflector
Shiori
Skype
Splashtop Streamer
StartNinja
Stickies
System Preferences
TextEdit
TinkerTool
TotalFinder
VLC
cooViewer
iTerm
~~~

### Install PHP (via php-build)

~~~bash
php-build --definitions
php-build 5.3.20 ~/.phpenv/versions/5.3.20
phpenv global 5.2.17
phpenv version
phpenv rehash
php -v
    # Add phpcs for FuelPHP
ln -s ~/.php/fuelphp-phpcs/Standards/FuelPHP `brew --prefix php-code-sniffer`/CodeSniffer/Standards/FuelPHP
~~~

### Install pandoc (via Haskell-Platform)

~~~bash
cabal update
cabal install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
~~~

### Change shell(bash -> zsh)

~~~bash
chsh -s /bin/zsh 
cat /etc/shells
~~~

### Add quickLook plugin

~~~bash
mkdir ~/Library/QuickLook/
cp -r ~/.dotfiles/quicklook/* ~/Library/QuickLook
killall Finder
~~~

### Install gem (via ruby-gem)

~~~bash
gem install bundler
rbenv rehash
bundle install
~~~


~~~diff
    # Configure kramdown
vim `rbenv prefix`/lib/ruby/gems/*/gems/kramdown-`kramdown -v`/lib/kramdown/options.rb

-    define(:coderay_line_numbers, Symbol, :inline, 
+    define(:coderay_line_numbers, Symbol, nil, 
~~~

~~~diff
    # Configure ruhoh
vim `rbenv prefix`/lib/ruby/gems/*/gems/ruhoh-2.5/lib/ruhoh/converter.rb

+       module Markdown
+           def self.extensions
+               ['.md', '.markdown']
+           end
+           def self.convert(content)
+               require 'kramdown'
+               Kramdown::Document.new(content).to_html
+           end
+       end
~~~

### Configure vim & install vim plugin

~~~bash
    # plugin
vim
    # mkdir -p ~/.vim/bundle
    # git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
cd ~/.vim/bundle/neosnippet
git update-index --assume-unchanged autoload/neosnippet/snippets/php.snip
~~~
~~~bash
    # Build LiveStyle
cd ~/.vim/bundle/livestyle-vim/livestyled
go get code.google.com/p/go.net/websocket
go build livestyled.go
~~~
~~~bash
    # Gist-vim
curl -i -u "GITHUB-USERNAME" -d '{"scopes":["gist"],"note":"gist vim"}' https://GITHUB-DOMAIN/api/v3/authorizations # => copy token param
vim ~/.gist-vim            # => set token
chmod 600 ~/.gist-vim
~~~

### [BOWER](http://bower.io/)

- [GruntとBowerを使ってWeb開発用のテンプレートを作成する - タチコマ好きなエンジニアのブログ](http://yukihir0.hatenablog.jp/entry/2013/08/06/224722)
- [Bower入門(基礎編) - from scratch](http://yosuke-furukawa.hatenablog.com/entry/2013/06/01/173308)

~~~bash
brew install node.js
npm install -g bower
~~~

### Configure KeyRemap4MakBook

~~~bash
cd ~/.dotfiles
sh ./keyremap4mb-importconfig.sh
~~~
