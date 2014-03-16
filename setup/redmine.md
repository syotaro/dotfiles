# Redmine installation on MacOSX

## Install brew & gems

- Follow the instructions on [https://github.com/mxcl/homebrew](https://github.com/mxcl/homebrew)

  ~~~
  /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
  ~~~

- Install MySQL server

  ~~~
  brew install mysql
  ~~~

- Install ImageMagick

  ~~~
  brew install imagemagick --disable-openmp
  ~~~

- Some gems might be installed into the *global* gemset since they are needed in other projects too.

  ~~~
  gem install bundler
  gem install mysql2
  gem install rails
  gem install rake
  gem install rmagick
  ~~~

## Install Redmine

- Follow the instructions on [http://www.redmine.org/projects/redmine/wiki/RedmineInstall](http://www.redmine.org/projects/redmine/wiki/RedmineInstall)

  ~~~
  git clone git://github.com/redmine/redmine.git
  cd redmine
  ~~~

- Follow the instructions on the [Redmine page](http://www.redmine.org/projects/redmine/wiki/RedmineInstall) to create a
- config DB(MySQL)

  ~~~
  cp -a config/database.yml.example vim config/database.yml
  vim config/database.yml
  ~~~
  ~~~
  mysql.server start
  mysql -u root -p
  mysql> create database redmine character set utf8;
  mysql> create user 'redmine'@'localhost' identified by 'redmine';
  mysql> grant all privileges on redmine.* to 'redmine'@'localhost';
  ~~~

- install gems to repository

  ~~~
  bundle install --path vendor/bundle --without development test postgresql
  ~~~

- Migrate and seed the database

  ~~~
  bundle exec rake generate_secret_token
  bundle exec rake db:create RAILS_ENV=production
  bundle exec rake db:migrate RAILS_ENV=production
  bundle exec rake redmine:load_default_data RAILS_ENV=production
  ~~~

- Start Redmine

  ~~~
  bundle exec rails s -e production -p 3000
  ~~~

## Add Plugin

- [alrick/Reddrop](https://github.com/alrick/Reddrop)
- [zh/redmine_importer](https://github.com/zh/redmine_importer)
- [peclik/clipboard_image_paste](https://github.com/peclik/clipboard_image_paste)

## Add Theme

git clone git://github.com/farend/redmine_theme_farend_basic.git public/themes/farend_basic

## Config

1. 管理者ログイン、パスワード変更
2. redmine全体の管理設定
  - [メール通知](http://redmine.jp/faq/general/mail_notification/)

    ~~~
    cp -a  config/configuration.yml.example config/configuration.yml
    ~~~

  - [メールの送信元アドレス(From)を変更](http://redmine.jp/faq/general/mail-from/)
3. ユーザを登録する
  - メールが届くことを確認する
4. プロジェクトを作成する
5. プロジェクトの「設定」を行う
  - 「トラッカー」を修正する。「バグ」「改修・新規機能」「作業」
  - 「チケット」へのカスタムフィールドを追加する
      - トラッカーの「バグ」に対して、発見バージョンや環境、画面、不具合種別などを追加する
6. プロジェクトにメンバーを追加
  - 管理者、開発者、報告者
7. 「ロードマップ」を作成する
8. チケットを登録する
  - 「Importer」モジュールを使い、CSVで一括登録する
  - 「作成者」「登録者」には、メンバーのログイン名を用いる
  - 「ステータス」「題名」「優先度」が必須項目。親子関係を持たせる場合、「ID」と「親チケット」カラムも必要
9. [画面の文言を変更](http://redmine.jp/faq/general/modify-messages/)
10. リポジトリ連携(Git,SVN)

## 公開

- インターネットに公開する際は、httpsで


