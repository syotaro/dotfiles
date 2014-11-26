```bash
  # Back up the previous environment
$ gem list
$ brew list
$ brew cask list
$ defaults read
$ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
and check Files other than Dropbox(Recommended TimeMachine!)


## OSX setup flow

```
### Install Dropbox

- [Dropbox](https://www.dropbox.com/home)

### Install Apps (via AppStore)

```bash
    # => manually
    # app list generate command
    # => $ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
1Password
2D Grapher
Airmail 2
AnyVideo Converter HD
App Language Chooser
Artboard
Asset Catalog Creator
Astro
Briefs
Cinemagraph Pro
CloudPlay
Cobook
CodeRunner
ColorSchemer Studio
Current
Dash
DateLine
Deliveries
Desktop Calendar Plus
Easy Image Converter
Elastics
Explainer
Export Calendars Pro
Friends export
GCalToolkit
GarageBand
GistPal
Gistify
GraphicConverter 9
Hexels Pro
IMAGEmini
Icon Slate
Infographics
JPEGmini
JSON Editor
JenkinsNotifier
Kaleidoscope
Kaomoji Lover
Keynote
Kobito
LINE
MathGraph
Microsoft OneNote
Microsoft Remote Desktop
Movist
Murasaki
MyAScript
Navicat Data Modeler
Navicat Premium Essentials
Navicat for MySQL
Nephorider
NeverSleep
New Relic Menu Bars
NewsBar
Numbers
OmniGraphSketcher
OmniOutliner Pro
OmniPlan
OmniPopPro
Orrery
PDF2Office for OmniGraffle
PNG Compressor
PageLayers
Pages
PaintCode
PasteAsFile
Patterns
Paw
Pixelmator
QuickHub
RankGuru SEO
ReadKit
Remote Desktop
RocketDocs
Server
Sketch
Skitch
Slack
SoraAnnai
Tapes
TaskInsight
Templates for Office Pro
The Archive Browser
TimeWorks
Translate Tab
Transmit
Tuba
Tweetbot
Unclutter
Visits
VisualDiffer
VisualGrep
WebCode
WhiteNoise
WinArchiver
Witch
WordService
XMenu
Xcode
Zip Expert
homebrew-cask
iKeyboard
iMovie
iPhoto
iTranslate
xScope
```

```bash
    # Install Require Tools
open /Applications/Xcode.app
java -version                # => Java Install manually
xcodebuild -license
xcode-select --install
```

### Setup ssh key

```bash
ln -sf ~/Dropbox\ (個人)/ ~/Dropbox
mkdir ~/.ssh
ln -s ~/Dropbox/work/setting/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```

### Setup dotfiles

```bash
mkdir ~/dotfiles &&  cd ~/dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./setup.sh
```

### Configure OS X

```bash
cd ~/dotfiles
sh ./osx.sh
```

### Install Apps (via homebrew or other)

```bash
    # Install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew    doctor
brew    install git
brew    update
export  HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew    install caskroom/cask/brew-cask
sh      brewfile.sh
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew    cask alfred link
brew    linkapps
```
- open Package
  - open /opt/homebrew-cask/Caskroom/*/*/*.pkg

- manual install
  - [Chrome Canary](https://www.google.co.jp/intl/en/chrome/browser/canary.html)
  - [Chrome](http://www.google.com/chrome/)


### Configure BBT(on GUI)

```
import ~/dotfiles/bettertouchtool/bbt-setting-export
```

### Install PHP  (via php-build) + Apache

```bash
sudo vim /private/etc/apache2/httpd.conf #=> phpを有効化
sudo ln -s ~/dotfiles/php/php.ini /etc/
sudo apachectl -k restart
brew install php54-xdebug phpunit phpmd php-code-sniffer
```

```bash
//  brew install httpd
//  brew tap     'josegonzalez/homebrew-php'
//  brew install --HEAD 'phpenv'
//  brew install 'php-build'
//  ```
//  ```diff
//  sudo vim /usr/local/share/php-build/default_configure_options
//  ++ --with-apxs2=/usr/local/sbin/apxs
//  ```
//  
//  ```bash
//      # phpのビルドに必要なライブラリをインストール
//  brew install 're2c'
//  brew install 'libjpeg'
//  brew install 'libpng'
//  brwe install 'mcrypt'
//  brew install 'libmcrypt'
//     # phpのビルド via php-build
//  php-build --definitions
//  php-build 5.4.13 ~/.phpenv/versions/5.4.13
//  phpenv version
//  phpenv global 5.4.13
//  phpenv version
//  phpenv rehash
//  exec zsh -l
//  php -v
//      # apache module 切り替え※うまくいかない。PHPのインストール手順については、全体的に見直す必要あり
//  git clone https://github.com/garamon/phpenv-apache-version ~/.phpenv/plugins/phpenv-apache-version
//  cp $HOME/.phpenv/versions/5.4.13/libexec/apache2/libphp5.so $HOME/.phpenv/versions/5.4.13/
//   phpevn apache-version
//      # phpのoptionをInstall
//  brew install 'pcre'
//  brew install 'phpunit'
//      # phpcs
//  pear install PHP_CodeSniffer
//      # composer
//  cd $HOME
//  curl -sS https://getcomposer.org/installer | php
//  mv composer.phar /usr/local/bin/composer
//  ```
//  
//  ```bash
//  sudo apachectl restart
//  cd /Library/WebServer/Documents
```


```bash
    # PHPUnitのインストール
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear install pear.phing.info/phing
    # phpunit コマンドが使えるようになったか確認します。
phpunit --version
```

```bash
    # Add phpcs for FuelPHP
ln -s ~/.php/fuelphp-phpcs/Standards/FuelPHP `brew --prefix php-code-sniffer`/CodeSniffer/Standards/FuelPHP
```

```bash
    # configure php
// sudo vi /usr/local/etc/php/5.4/php.ini
 
[Date]
date.timezone = Asia/Tokyo
 
[mbstring]
mbstring.language = Japanese
mbstring.internal_encoding = UTF-8
mbstring.http_output = UTF-8
```

### Install pandoc (via Haskell-Platform)

```bash
cabal update
cabal install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
```


### Setup ZshFramework(Prezto)

```bash
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
unlink ~/.zshrc
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
unlink ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### Change shell(bash -> zsh)

```bash
chsh -s /bin/zsh 
cat /etc/shells
```

### Add quickLook plugin

```bash
brew update; brew upgrade brew-cask
brew cask install qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
```

### Install Ruby


```ruby
brew install rbenv ruby-build
    # Install Ruby 2.1.3 and set it as the default version
rbenv install 2.1.3
rbenv global  2.1.3
ruby -v  =>  ruby 2.1.3
    # インストールしたrubyやgemのパスを通す
rbenv rehash
    # インストールされてるrubyのバージョン一覧を確認
```

```bash
    # gem
gem update --system
gem update rake
gem install bundler
bundle install
```


### Configure vim & install vim plugin

```bash
    # plugin
vim
    # mkdir -p ~/.vim/bundle
    # git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
cd ~/.vim/bundle/neosnippet
vim -c NeoBundleInstall!
```
```bash
    # Gist-vim
curl -i -u "GITHUB-USERNAME" -d '{"scopes":["gist"],"note":"gist vim"}' https://GITHUB-DOMAIN/api/v3/authorizations # => copy token param
vim ~/.gist-vim            # => set token
chmod 600 ~/.gist-vim
```

### BOWER


```bash
brew install node.js
npm install -g bower
```

### Configure MySQL

```bash
    # MySQLデータベースを作成(to Dropbox)
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=$HOME/Dropbox/work/database/localhost/data --tmpdir=/tmp
    # アクセス権限を付与
chmod -R 777 $HOME/Dropbox/work/database/localhost/data

    # MySQLの開始
mysql.server start
    # MySQLの初期セットアップ
/usr/local/opt/mysql/bin/mysql_secure_installation

  Enter current password for root (enter for none): 
  Set root password? [Y/n] Y
  New password: 
  Re-enter new password: 
   ... Success!
  Remove anonymous users? [Y/n] y
   ... Success!
  Disallow root login remotely? [Y/n] y
   ... Success!
  Remove test database and access to it? [Y/n] n
   ... skipping.
  Reload privilege tables now? [Y/n] y
   ... Success!
  installation should now be secure.

  Thanks for using MySQL!

    # ログイン
mysql -uroot
    # パスワード設定
mysqladmin -u root password 'new-password'
    # my.cnfの読み込み順を確認
mysql --help | grep my.cnf
```

### Install Quicklook Plugin

```
brew install ffmpeg --with-tools media-info
cp -rf ~/dotfiles/Library/QuickLook/* ~/Library/QuickLook
qlmanage -r
qlmanage -r cache
```

### Configure QuickLook

```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
```

### Config

- integrate Kaleidoscope

```
cd /Applications/Kaleidoscope.app/Contents/Resources/Integration/scripts
./install_git-default
```

## Install AWS CLI
```
sudo easy_install pip
sudo pip install awscli
sudo pip install awscli --upgrade
aws ec2 describe-instances | jq '.'
```

### python markdown for evervim

```sh
$ sudo pip install markdown
```

### Configure OSX

```sh
$ ksdiff ~/dotfiles/Library/ ~/Library
```


