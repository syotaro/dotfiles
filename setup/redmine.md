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


## Add Theme

git clone git://github.com/farend/redmine_theme_farend_basic.git public/themes/farend_basic
vim config/settings.yml


## Config

1. 管理者ユーザの設定
  - admin/adminでログイン
  - 個人設定
    - メールアドレス変更
    - パスワード変更
2. redmine全体の管理設定
  - 「管理」>「トラッカー」
    - 「バグ」「改修・新規機能」「定型作業」
  - 「管理」>「設定」
    - 「全般」
      - 「テキストの書式」>「Markdownに変更」
    - 「プロジェクト」
      - 「ファイル」「フォーラム」を無効化
      - 「Importer」を有効化
    - 「カスタムフィールド
      - 必要に応じて追加
    - [メール通知](http://redmine.jp/faq/general/mail_notification/)
      - SMTPサーバを用意し、その設定情報を「``config/configuration.yml``」に記入する
      - [メールの送信元アドレス(From)を変更](http://redmine.jp/faq/general/mail-from/)
3. ユーザを登録する
  - メールが届くことを確認する
4. プロジェクトを作成する
  - 「設定」
    - モジュール:任意のものを選択
    - メンバー:任意のグループを、ろーると併せて追加
    - バージョン:直近のイベントバージョンを追加作成
      - このタイミングで、「ロードマップ」タブが出現する
    - チケットのカテゴリ:チケット分類用の汎用カテゴリ。どの機能に属するか、などで分類するのが一般的。
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


## Add Plugin

### [alrick/Reddrop](https://github.com/alrick/Reddrop)

bundle install
git clone git@github.com:alrick/Reddrop.git plugins/redmine_reddrop
bundle exec rake redmine:plugins:migrate RAILS_ENV=production


### [zh/redmine_importer](https://github.com/zh/redmine_importer)


### [peclik/clipboard_image_paste](https://github.com/peclik/clipboard_image_paste)
