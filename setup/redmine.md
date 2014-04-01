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

その他初期設定 [日本語での利用に適した設定 — Redmine.JP](http://redmine.jp/tech_note/first-step/admin/settings-for-japanese/)

## 公開

- インターネットに公開する際は、httpsで


## Add Plugin

### [zh/redmine_importer](https://github.com/zh/redmine_importer)

gem install fastercsv
git clone git@github.com:zh/redmine_importer.git plugins/redmine_importer
cd ..
bundle install
bundle exec rake redmine:plugins:migrate RAILS_ENV=production

### [peclik/clipboard_image_paste](https://github.com/peclik/clipboard_image_paste)

git clone https://github.com/peclik/clipboard_image_paste.git plugins/clipboard_image_paste


### redmine_startpage
git clone git@github.com:txinto/redmine_startpage.git plugins/redmine_startpage

### Wiki TIcket List

### Banner

cd plugins
git clone git@github.com:akiko-pusu/redmine_banner.git
cd ..
bundle exec rake redmine:plugins:migrate RAILS_ENV=production

## カスタムクエリ

- 担当者なし（未アサイン）
  - ステータス：未完了
  - 担当者：なし
- 対象バージョンなし
  - ステータス：未完了
  - 対象バージョン：なし
- 進行中
  - ステータス：等しい：進行中
- フィードバック
  - ステータス：等しい：フィードバック
- 解決（対応済みで確認待ちのもの）
  - ステータス：等しい：解決
- ロードマップ別
  - ステータス：未完了
  - オプション
    - グループ条件：対象バージョン
- 担当者別
  - ステータス：未完了
  - 担当者：すべて
  - ・オプション
    - グループ条件：担当者
- ステータス別
  - ステータス：未完了
  - ・オプション
  - グループ条件：ステータス
- 最近◯日以内に更新されたもの
  - 更新日：過去◯日：7（1週間の場合、任意の数字でOK）
- 自分のチケット
  - 担当者：等しい：<<自分>>

## 各列挙項目ネーミング規則

- 下記を意識する
  - プロジェクト > サブプロジェクト > バージョン > 親チケット > 子チケット > トラッカー > カテゴリ









# redmine-MBrdige

git clone git@github.com:zh/redmine_importer.git plugins/redmine_importer
cd plugins/
ls -l
chown nginx:nginx redmine_importer/
chown -R nginx:nginx redmine_importer/

gem install fastercsv
bundle install
rake redmine:plugins:migrate RAILS_ENV=production
/etc/init.d/nginx restart

cp /usr/share/zoneinfo/Japan /etc/localtime  # 日付をJSTにする

## ファイルをアップロードできない件の対処
vim /etc/nginx/nginx.conf
// 以下を追記する
location ~* ^(?:(?:plugin_assets/|themes/).+/)(?:javascripts/.+\.js|stylesheets/.+\.css|images/.+\.(?:jpe?g|gif|htc|ico|png|html))$ {

## ファイルアップロード容量の拡大

- 管理 > 設定 > 全般 > 添付ファイルサイズの上限 > 100mに
- nginxの設定を修正
vim /etc/nginx/nginx.conf
        client_max_body_size 100m; <-- 増やす

## mysql高速化

innodb_flush_log_at_trx_commit = 2
log_bin = 0
skip_innodb_doublewrite


## コマンドメモ

migrationコマンド

rake redmine:plugins:migrate RAILS_ENV=production
リポジトリのfetchコマンド

rake redmine:fetch_changesets RAILS_ENV=production

## Graphz

yum install -y graphviz graphviz-gd
