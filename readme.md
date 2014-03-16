## OSX setup flow

### Install Dropbox

- [Dropbox](https://www.dropbox.com/home)

### Install Apps (via AppStore)

~~~bash
    # => manually
    # app list generate command
    # => $ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
1Password
AWS Menu Bar
App Language Chooser
CloudPlay
Cocoa JSON Editor
CodeRunner
ColorSchemer Studio
Dash
Desktop Calendar Plus
Elastics
Frank DeLoupe
Gemini
GistPal
GraphicConverter
Handheld Designer
Hexels
Hype2
Infographics
JPEGmini
JSON Editor
Keynote
LINE
LiveReload
Markdown Pro
Market Junkie
MenuTab Pro for Facebook
Murasaki
Navicat Data Modeler
Navicat Premium Essentials
Navicat for MySQL
Numbers
OmniGraphSketcher
OmniPlan
PDF Reader
PDF2Office for OmniGraffle
PNG Compressor
PageLayers
Pages
PaintCode
Particle Playground
Patterns
Paw
Pixelmator
QuickHub
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
Transmit
Tuba
Unclutter
Visits
WebCode
WhiteNoise
WiFi Explorer
WinArchiver
Witch
Xcode
YoruFukurou
iBooks Author
iKeyboard
picatext
~~~

- [CSV Editor 2](https://itunes.apple.com/jp/app/csveditor-2/id644191861?mt=12)


~~~bash
    # Install Require Tools
open /Applications/Xcode.app
java -version                # => Java Install manually
~~~

### Setup ssh key

~~~bash
mkdir ~/.ssh
ln -s ~/Dropbox/work/setting/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
~~~

### Setup dotfiles

~~~bash
mkdir ~/dotfiles &&  cd ~/dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./setup.sh
~~~

### Configure OS X

~~~bash
cd ~/dotfiles
sh ./osx.sh
~~~

### Install Apps (via homebrew or other)

~~~bash
    # Install
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew    doctor
brew    update
cat     ~/dotfiles/Brewfile
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install brew-cask
brew bundle
brew cask alfred link
brew linkapps
~~~

### Configure BBT(on GUI)

~~~
import ~/dotfiles/bettertouchtool/bbt-setting-export
~~~

### Install PHP  (via php-build) + Apache

~~~bash
sudo vim /private/etc/apache2/httpd.conf #=> phpを有効化
sudo ln -s ~/dotfiles/php/php.ini /etc/
sudo apachectl -k restart
brew install php54-xdebug phpunit phpmd php-code-sniffer
~~~

~~~bash
//  brew install httpd
//  brew tap     'josegonzalez/homebrew-php'
//  brew install --HEAD 'phpenv'
//  brew install 'php-build'
//  ~~~
//  ~~~diff
//  sudo vim /usr/local/share/php-build/default_configure_options
//  ++ --with-apxs2=/usr/local/sbin/apxs
//  ~~~
//  
//  ~~~bash
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
//  ~~~
//  
//  ~~~bash
//  sudo apachectl restart
//  cd /Library/WebServer/Documents
~~~


~~~bash
    # PHPUnitのインストール
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear install pear.phing.info/phing
    # phpunit コマンドが使えるようになったか確認します。
phpunit --version
~~~

~~~bash
    # Add phpcs for FuelPHP
ln -s ~/.php/fuelphp-phpcs/Standards/FuelPHP `brew --prefix php-code-sniffer`/CodeSniffer/Standards/FuelPHP
~~~

~~~bash
    # configure php
// sudo vi /usr/local/etc/php/5.4/php.ini
 
[Date]
date.timezone = Asia/Tokyo
 
[mbstring]
mbstring.language = Japanese
mbstring.internal_encoding = UTF-8
mbstring.http_output = UTF-8
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
brew update; brew upgrade brew-cask
brew cask install qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
~~~

### Install Ruby


~~~ruby
    # openssl、readlineのインストール
brew install openssl readline
    # ruby-buildをインストール
brew install --HEAD ruby-build
    # rbenv(rubyのバージョン管理ツール)のインストール
brew install rbenv

    # 下記を.zshrcに追記してpathを通す
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
    # Rubyをrbenv経由でバージョン指定インストール
rbenv install -l
brew link readline --force
RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`" rbenv install 2.0.0-p247

    # インストールしたrubyやgemのパスを通す
rbenv rehash
    # インストールされてるrubyのバージョン一覧を確認
rbenv global 2.0.0-p247
brew unlink readline
~~~

~~~bash
    # gem
gem update --system
gem update rake
gem install bundler
bundle install
~~~


~~~diff
    # Configure kramdown
cd ~/dotfiles
vim `rbenv prefix`/lib/ruby/gems/*/gems/kramdown-`kramdown -v`/lib/kramdown/options.rb

-    define(:coderay_line_numbers, Symbol, :inline, 
+    define(:coderay_line_numbers, Symbol, nil, 
~~~

~~~diff
    # Configure ruhoh
vim `bundle show ruhoh`/lib/ruhoh/converters/markdown.rb

-      def self.convert(content)
-        require 'redcarpet'
-        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:with_toc_data => true),
-          :autolink => true, 
-          :fenced_code_blocks => true, 
-        )
-        markdown.render(content)
-      end
+      def self.convert(content)
+          require 'kramdown'
+          Kramdown::Document.new(content).to_html
+      end
~~~

### Configure vim & install vim plugin

~~~bash
    # plugin
vim
    # mkdir -p ~/.vim/bundle
    # git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
cd ~/.vim/bundle/neosnippet
git update-index --assume-unchanged autoload/neosnippet/snippets/php.snip
vim -c NeoBundleInstall!
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

### BOWER


~~~bash
brew install node.js
npm install -g bower
~~~

### Configure KeyRemap4MakBook

~~~bash
    # /Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli export > ~/dotfiles/keyremap4mb-importconfig2.sh
cd ~/dotfiles
sh ./keyremap4mb-importconfig2.sh
~~~

### Configure MySQL

~~~bash
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
~~~

### Install Quicklook Plugin

~~~
cp -r ~/dotfiles/quicklook_plugin/* ~/Library/QuickLook
~~~

### Configure QuickLook

~~~
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
~~~

### Config

- integrate Kaleidoscope

~~~
cd /Applications/Kaleidoscope.app/Contents/Resources/Integration/scripts
./install_git-default
~~~
