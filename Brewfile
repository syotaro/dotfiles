# Make sure using latest Home
update

# Update already-installed formula (takes too much time, I will do it manually later)
# upgrade

############################################
# Add Repository
############################################
#tap  home/dupes        || true
tap phinze/homebrew-cask  || true
tap caskroom/homebrew-versions || true  # add beta pkg
tap homebrew/binary       || true
tap jimbojsb/launchrocket || true
tap jingweno/gh           || true


############################################
# Add Packages for Development
############################################
#install 'fuse4x'
#install 'fuse4x-kext'
install 'haskell-platform'  # Install until the end, very time-consuming
#install 'python3'
install 'autoconf'
install 'automake'
install 'gh'
install 'bash'
install 'bdw-gc'
#install 'bsdmake'
install 'cmake'    # be require from mysql
install 'colordiff'
install 'coreutils'
install 'cscope'
install 'ctags'
install 'curl'          # ln -s ` --prefix curl`/bin/curl /usr/local/bin
install 'freetype'
install 'gdbm'
install 'gettext'
install 'glib'
install 'gmp'
install 'gnu-sed' --default-names
install 'go'
install 'graphicsmagick'
install 'htop-osx'
install 'hub' # wrapper for  git command
install 'icu4c'
install 'imagemagick' --disable-openmp
install 'jpeg'
install 'jq'         # JSONパーサー
install 'libevent'
install 'libffi'
install 'libpng'
install 'libtool'
install 'libyaml'
install 'lua'
install 'lv'
install 'lynx'
install 'macvim' '--with-lua --override-system-vim --custom-icons'
install 'multitail'
install 'nkf'
install 'ngrep'
install 'nmap'    # port scan util
install 'oniguruma'
install 'pidof'
install 'pkg-config'
install 'omnioutliner'
install 's3cmd'
install 'sqlite'
install 'sshfs'
install 'tcpflow'
install 'the_silver_searcher'
install 'tree'
install 'unixodbc'
install 'w3m'  # CLI Web Browser
install 'pstree'
install 'watch'
install 'wget' --enable-iri
install 'xz'
install 'z'
install 'zsh' --disable-etcdir
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
install 'mysql'
################
#  FONT
################
# tap  'sanemat/font'
#  'ricty'
# #cp -f /PATH/TO/RICTY/fonts/Ricty*.ttf ~/Library/Fonts/
# #fc-cache -vf
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
# Packages for brew-cask
# install brew-cask
# .dmg from brew-cask

cask install 'adobe-air'
cask install 'adobe-creative-cloud'
cask install 'alfred'
#cask install 'alfred' --link  # CaskroomをAlfredの検索パスに追加
cask install 'appcleaner'
cask install 'bartender'
cask install 'bathyscaphe'   # 2ch ブラウザ
cask install 'bettertouchtool'
cask install 'camtasia'
cask install 'clipmenu'
cask install 'flash'
cask install 'fluid'
cask install 'yorufukurou'
cask install 'google-chrome'
cask install 'google-chrome-canary'
cask install 'intellij-idea'
cask install 'iterm2'
cask install 'keyremap4macbook'
cask install 'ksdiff'
cask install 'launchrocket'
cask install 'marked'
cask install 'perian'
cask install 'quickcast'
cask install 'openemu-experimental'
cask install 'rcdefaultapp'
cask install 'reflector'
cask install 'silverlight'
cask install 'skype'
cask install 'skitch'
cask install 'teamviewer'
cask install 'google-japanese-ime'
cask install 'testflight'
cask install 'totalfinder'
cask install 'vagrant'
cask install 'versions'  # Subversion Client
cask install 'virtualbox'
cask install 'vlc'
cask install 'postbox'
cask install 'soundflower'
cask install 'vmware-fusion'
cask install 'cloudytabs'
cask install 'unity-web-player'
#cask install 'codekit'
#cask install 'dropbox'
#cask install 'evernote'
#cask install 'forklift'
#cask install 'google-web-designer'
#cask install 'gyazo'
#cask install 'libreoffice'
#cask install 'mysqlworkbench'
cask install 'omnigraffle'
#cask install 'parallels-9'
#cask install 'path-finder'
#cask install 'phpstorm'
#cask install 'redis-desktop-manager'
#cask install 'sequel-pro'
#cask install 'splashtop-streamer'
#cask install 'x-quartz'




################
# QuickLook Plugin
################
cask install 'betterzipql'
cask install 'qlcolorcode'
cask install 'qlmarkdown'
cask install 'qlprettypatch'
cask install 'qlstephen'       # view plain text files without a file extension
cask install 'quicklook-csv'
cask install 'quicklook-json'
cask install 'webp-quicklook'
#cask install 'suspicious-package'

############################################
# Remove outdated versions
############################################
cleanup

############################################
#  Memo
############################################
# --config      # Homebrewの設定一覧
# --prefix pkg名 # Install path
# cask search   # lisgint cask Application
# leaves | sed 's/^/install /'   # install済みpkgを追記
# cleanup
# doctor
# info          # インストールしたpkgの設定方法確認
# link          # パッケージを有効化
# options
# search        # listing pkg
# tap           # (ex. brew tap homebrew/dupes => GitHubにある外部のFormulaセットを追加することが可能になる
# unlink        # パッケージを一時的に無効化
# cd ` --prefix` # homebrewの保存先であるCellerディレクトリの場所に移動する
#
# 以下のApplicationは、現状Caskが無いので、手動でInstallする
# - Gyazo gif
# - GlyphDesigner
# - MS Office
# - ParticleDesigner
# - cooviewer
# - Lingr
# - Autoclick
# - https://github.com/cookpad/iam-fox
# - https://github.com/cookpad/elasticfox-ec2tag
# - https://github.com/cookpad/r53-fox
## 個別に設定が必要なもの
# - Unclutter
# - Mi


