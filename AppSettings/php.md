
### Install PHP  (via php-build) + Apache

```sh
sudo vim /private/etc/apache2/httpd.conf #=> phpを有効化
sudo ln -s ~/dotfiles/php/php.ini /etc/
sudo apachectl -k restart
brew install php54-xdebug phpunit phpmd php-code-sniffer
```

```sh
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


```sh
    # PHPUnitのインストール
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear install pear.phing.info/phing
    # phpunit コマンドが使えるようになったか確認します。
phpunit --version
```

```sh
    # Add phpcs for FuelPHP
ln -s ~/.php/fuelphp-phpcs/Standards/FuelPHP `brew --prefix php-code-sniffer`/CodeSniffer/Standards/FuelPHP
```

```sh
    # configure php
// sudo vi /usr/local/etc/php/5.4/php.ini
 
[Date]
date.timezone = Asia/Tokyo
 
[mbstring]
mbstring.language = Japanese
mbstring.internal_encoding = UTF-8
mbstring.http_output = UTF-8
```
