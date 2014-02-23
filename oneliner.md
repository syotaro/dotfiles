

# Windowsファイルの文字コードをOSXでも読めるように
nkf --unix -w --overwrite ./ファイル名

# treeコマンドの結果をExcel貼付用に良い感じに整形するワンライナー
tree -NF | perl -pe 's/^├── //g; s/^└── //g; s/^│\xc2\xa0\xc2\xa0\x20//g; s/├── /\t/g; s/│\xc2\xa0\xc2\xa0\x20/\t/g; s/└── /\t/g; s/    /\t/g; s/\*$//g; s/^\.\n//g;'

# Siege
siege --concurrent=2 --reps=100 --time=1m --internet --file=siege_file.txt --log=~/Desktop/siege_`date '+%Y%m%d%H%M%S'`.log

# Git
git show-branch

ctags -R --langmap=PHP:.php.inc --php-kinds=c+f+d ./
# App Store
mdfind "kMDItemAppStoreHasReceipt=1"

# app list generate command
# $ diff -y <(mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ;}' | sort) <( ls /Applications| grep '.app' | sort) | grep '>' | awk '{for( i = 2; i < NF; i++ ){printf( "%s ", $i );}print $NF;}' | awk '{sub(".app","")}{print}' | egrep -v 'Safari|iTune|Time Machine|Mail|Reminders|QuickTime|Preview|Photo Booth|Notes|App Store|Automator|Calculator|Dictionary|Dashboard|DVD Player|FaceTime|Game Center|Image Capture|Messages|Mission Control|Calendar|Chess|Contacts|Launchpad|Stickies'

# Find

ag -g .plist ./
ag @todo -A 10 -B 10 --ignore-dir ./vendor --file-search-regex .php$ ./
find ./ -name '*.php' | xargs grep -i 


## ワンライナーとは

- [commandlinefu.com](http://www.commandlinefu.com/commands/browse)


## 自分のいるディレクトリを取得

~~~
$ CURRENT=$(cd $(dirname $0) && pwd)
~~~

シェルスクリプトと設定ファイルを同じディレクトリにおいて

~~~
$ mv /etc/init.d/httpd.conf /etc/init.d/httpd.conf.bak
$ ln -s $CURRENT/httpd.conf /etc/init.d/httpd.conf
~~~

と簡単に書くことができる。
絶対パスへの依存は極力なくしていくことが大事

同じスクリプトを繰り返し実行しても問題ないように


~~~
if [ ! -L /etc/init.d/httpd.conf ]; then mv /etc/init.d/httpd.conf /etc/init.d/httpd.conf.bak ln -s $CURRENT/httpd.conf /etc/init.d/httpd.conf
fi 
~~~

としておくと安全


## 実行したサーバ向けのSQLクエリをモニタリング

~~~
tcpdump -i eth0 -s 0 -l -w - dst port 3306 | strings | perl -e '
while(<>) { chomp; next if /^[^ ]+[ ]*$/;
  if(/^(SELECT|UPDATE|DELETE|INSERT|SET|COMMIT|ROLLBACK|CREATE|DROP|ALTER)/i) {
    if (defined $q) { print "$q\n"; }
    $q=$_;
  } else {
    $_ =~ s/^[ \t]+//; $q.=" $_";
  }
}'
~~~


### 3日以内に更新されたファイルを検索する

~~~
find . -mtime -3
~~~

### 前後20行をgrep

~~~
egrep -A 20 -B 20 "Error" rails_production.log
~~~

-n : マッチした行の先頭に行番号を表示する


### EPS画像をPDFフォーマットに変換

~~~
$ mkdir pdf ; for i in *.eps; do pstopdf "$i" -o "pdf/$i.pdf"; done
~~~


### [find] src/ 以下の、 .svn という名前の全ディレクトリを削除

find src -type d -name .svn -exec rm -rf {} \;

-  -type d はディレクトリ だけ取り出す。 -type f なら普通のファイルだけ。
-  -name .svn は完全一致。 "*" をワイルドカードに使える。
-  -exec はコマンド実行。 {} がファイル名に置換される。最後に \; をつける。


## 未読のGmailの件名を表示

~~~
curl -u YOUR-ACCOUNT:PASSWORD --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
~~~

