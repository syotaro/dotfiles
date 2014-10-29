############################################
# Add Repository
############################################
#tap  home/dupes               || true
tap phinze/homebrew-cask       || true
tap caskroom/homebrew-versions || true  # add beta pkg
tap homebrew/binary            || true
tap jimbojsb/launchrocket      || true
tap homebrew/science           || true
update || true


############################################
# Add Packages for Development
############################################
cask install 'xquartz'         # 依存されてるので先にInstall
install 'R'                    # required https://xquartz.macosforge.org/landing/
install 'autoconf'
install 'automake'
install 'bash'
install 'bdw-gc'
install 'cmake'                # be require from mysql
install 'colordiff'
install 'coreutils'
install 'cscope'
install 'ctags'
install 'curl'                 # ln -s ` --prefix curl`/bin/curl /usr/local/bin
install 'gdbm'
install 'gettext'
install 'gh'
install 'glib'
install 'gmp'
install 'gnu-sed' '--default-names'
install 'go'
install 'goaccess'
install 'graphicsmagick'
install 'haskell-platform'     # Install until the end, very time-consuming
install 'htop-osx'
install 'hub'                  # wrapper for  git command
install 'icu4c'
install 'imagemagick' '--disable-openmp'
install 'jenkins'
install 'jpeg'
install 'jq'                   # JSONパーサー
install 'jsonpp'
install 'libevent'
install 'libffi'
install 'libpng'
install 'libxml2'  # for nokogiri
install 'libxslt'  # for nokogiri
install 'libtool'
install 'libyaml'
install 'lua'
install 'lv'
install 'lynx'
install 'macvim' '--with-lua --override-system-vim --custom-icons'
install 'multitail'
install 'mysql-connector-odbc' # for Tableau
install 'ngrep'
install 'nkf'
install 'nmap'                 # port scan util
install 'npm'
install 'oniguruma'
install 'pidof'
install 'pkg-config'
install 'pstree'
install 's3cmd'
install 'sqlite'
install 'sshfs'
install 'sshrc'                # sshした先で読み込む環境変数をローカルで定義できる
install 'tcpflow'              # いい感じでHTTPリクエストをモニタリング
install 'the_silver_searcher'
install 'tree'
install 'unixodbc'
install 'w3m'                  # CLI Web Browser
install 'watch'
install 'weechat' '--with-ruby --with-python --with-perl'
install 'wget' '--enable-iri'
install 'xz'
install 'z'
install 'zsh' '--disable-etcdir'
#install 'bsdmake'
#install 'freetype'
#install 'fuse4x'
#install 'fuse4x-kext'
#install 'python3'
################
#  AWS
################
#aws-cfn-tools
#aws-elasticache
#aws-iam-tools
#yaws
#aws-mon
#aws-cloudsearch
#aws-elasticbeanstalk
#aws-sns-cli
#aws-as
#ec2-ami-tools
#ec2-api-tools
#rds-command-line-tools
#elb-tools
#s3cmd
#s3fs
################
#  Tmux
################
install 'tmux'
install 'reattach-to-user-namespace'
################
#  Bench Mark
################
install 'siege'
################
#  Ruby
################
install 'openssl'
install 'readline'
install 'ruby-build' --HEAD
install 'rbenv'
################
#  Git
################
install 'git'
install 'git-flow'
install 'tig'   # cli git browser
################
#  MySQL
################
# install 'mysql'
install 'mysql55'
################
#  FONT
################
# tap  'sanemat/font' || true
# install ricty || true
#         #cp -f /PATH/TO/RICTY/fonts/Ricty*.ttf ~/Library/Fonts/
#         #fc-cache -vf
################
#  PPSSPP  http://ppsspp.angelxwind.net/?page/downloads#osx
################
install 'sdl'
################
#  CSVTOOL
################
#install opam
# opam install csv

############################################
#  Cask          - 「 cask edit google-chrome」などで、オプション変更可能
############################################
install brew-cask || true

cask install 'LightPaper'           # MarkdownEditor
cask install 'adobe-air'
cask install 'adobe-creative-cloud' # open  '/opt/homebrew-cask/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
cask install 'alfred'
cask install 'android-file-transfer'
cask install 'appcleaner'
cask install 'bartender'
cask install 'bettertouchtool'
cask install 'camtasia'
cask install 'chefdk'               # Chef Development Kit
cask install 'cooviewer'
cask install 'evernote'             # AppStore版だと、Spotlight検索に対応してないので、Download版で入れること
cask install 'flash'
cask install 'fluid'
cask install 'google-drive'
cask install 'google-japanese-ime'
cask install 'hockeyapp'            # アプリのβ版配付
cask install 'intellij-idea'
cask install 'iterm2'
cask install 'keyremap4macbook'
cask install 'ksdiff'
cask install 'launchrocket'
cask install 'marked'
cask install 'omnigraffle'
cask install 'omnipresence'
cask install 'openemu-experimental'
cask install 'owncloud'
cask install 'perian'
cask install 'pixel-winch'
cask install 'quickcast'
cask install 'rcdefaultapp'
cask install 'silverlight'
cask install 'skitch'
cask install 'skype'
cask install 'stay'                 # Window位置の記憶
cask install 'teamviewer'
cask install 'testflight'
cask install 'totalfinder'
cask install 'unity-web-player'
cask install 'vagrant'
cask install 'vagrant-manager'
cask install 'virtualbox'
cask install 'vlc'
#cask install 'amazon-cloud-drive'
#cask install 'bathyscaphe'   # 2ch ブラウザ
#cask install 'clipmenu'
#cask install 'cloudytabs'
#cask install 'codekit'
#cask install 'dropbox'
#cask install 'forklift'
#cask install 'google-chrome'          # 手動で実体を/Applicationsフォルダに設置したほうがよい。でないと、1PasswordのExtentionが正常に動かない
#cask install 'google-chrome-canary'
#cask install 'google-web-designer'
#cask install 'gyazo'
#cask install 'keyboard-maestro'
#cask install 'keycue'
#cask install 'libreoffice'
#cask install 'mamp'
#cask install 'mysqlworkbench'
#cask install 'parallels-9'
#cask install 'path-finder'
#cask install 'phpstorm'
#cask install 'postbox'
#cask install 'redis-desktop-manager'
#cask install 'reflector'
#cask install 'rstudio'
#cask install 'sequel-pro'
#cask install 'soundflower'
#cask install 'splashtop-streamer'
#cask install 'versions'             # Subversion Client
#cask install 'vmware-fusion'
#cask install 'x-quartz'
#cask install 'yorufukurou'

cask alfred link  # CaskroomをAlfredの検索パスに追加
################
# QuickLook Plugin
################
#cask install 'suspicious-package'
cask install 'betterzipql'
cask install 'qlcolorcode'
cask install 'qlvideo'
cask install 'qlmarkdown'
cask install 'qlprettypatch'
cask install 'qlstephen'       # view plain text files without a file extension
cask install 'quicklook-csv'
cask install 'quicklook-json'
cask install 'webp-quicklook'

############################################
# Remove outdated versions
############################################
linkapps
cleanup

############################################
#  Memo
############################################
# --config                     # Homebrewの設定一覧
# --prefix pkg名               # Install path
# cask search                  # lisgint cask Application
# leaves | sed 's/^/install /' # install済みpkgを追記
# cleanup
# doctor
# info                         # インストールしたpkgの設定方法確認
# link                         # パッケージを有効化
# options
# search                       # listing pkg
# tap                          # (ex. brew tap homebrew/dupes => GitHubにある外部のFormulaセットを追加することが可能になる
# unlink                       # パッケージを一時的に無効化
# cd ` --prefix`               # homebrewの保存先であるCellerディレクトリの場所に移動する
#
# 以下のApplicationは、現状Caskが無いので、手動でInstallする
# - Gyazo gif
# - GlyphDesigner
# - MS Office
# - ParticleDesigner
# - Lingr
# - Autoclick
#   SoundCleod
#- https://github.com/cookpad/iam-fox
#- https://github.com/cookpad/elasticfox-ec2tag
#- https://github.com/cookpad/r53-fox
## 個別に設定が必要なもの
# - Unclutter
# - Mi
