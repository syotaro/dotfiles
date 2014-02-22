# gem install brewdler
# brewdle install
#
# brew search        # listing pkg
# brew cask search   # lisgint cask Application
# brew info          # インストールしたpkgの設定方法確認
# brew doctor
# brew options
# brew --config      # Homebrewの設定一覧
# brew --prefix pkg名 # Install path
# brew link
# brew unlink        # パッケージを一時的に無効化
# brew link          # パッケージを有効化
# cd `brew --prefix` # homebrewの保存先であるCellerディレクトリの場所に移動する
# brew tap           # (ex. brew tap homebrew/dupes => GitHubにある外部のFormulaセットを追加することが可能になる
# brew cleanup

tap  'homebrew/dupes'

brew 'macvim  --with-lua --override-system-vim --custom-icons'
brew 'autoconf'
brew 'automake'
brew 'bash'
brew 'colordiff'
brew 'bdw-gc'
brew 'bsdmake'
brew 'curl'          # ln -s `brew --prefix curl`/bin/curl /usr/local/bin
brew 'cmake'    # be require from mysql
brew 'coreutils'
brew 'cscope'
brew 'ctags'
brew 'freetype'
#brew 'fuse4x'
#brew 'haskell-platform'  # Install until the end, very time-consuming
#brew 'fuse4x-kext'
brew 'gdbm'
brew 'gettext'
brew 'glib'
brew 'jq'         # JSONパーサー
brew 'gmp'
brew 'go'
brew 'graphicsmagick'
brew 'htop-osx'
brew 'hub' # wrapper for  git command
brew 'icu4c'
brew 'imagemagick'
brew 'jpeg'
brew 'libevent'
brew 'libffi'
brew 'libpng'
brew 'libtool'
brew 'libyaml'
brew 'lua'
brew 'lv'
brew 'lynx'
brew 'multitail'
brew 'nkf'
brew 'nmap'    # port scan util
brew 'oniguruma'
brew 'pidof'
brew 'pkg-config'
#brew 'python3'
brew 's3cmd'
brew 'sqlite'
brew 'sshfs'
brew 'tcpflow'
brew 'the_silver_searcher'
brew 'tree'
brew 'unixodbc'
brew 'w3m'  # CLI Web Browser
brew 'watch'
brew 'wget --enable-iri'
brew 'xz'
brew 'zlib'
brew 'zsh --disable-etcdir'

################
#  Tmux
################
brew 'tmux'
brew 'reattach-to-user-namespace'
################
#  Bench Mark
################
brew 'siege'
################
#  Ruby
################
brew 'readline'
brew 'openssl'
brew 'ruby-build --HEAD'
brew 'rbenv'
################
#  Git
################
brew 'git'
brew 'git-flow'
brew 'tig'   # cli git browser
################
#  MySQL
################
brew 'mysql'


################
#  FONT
################
# tap  'sanemat/font'
# brew 'ricty'
# #cp -f /PATH/TO/RICTY/fonts/Ricty*.ttf ~/Library/Fonts/
# #fc-cache -vf

################
#  PPSSPP  http://ppsspp.angelxwind.net/?page/downloads#osx
################
brew 'sdl'



################
#  Cask
################
# - Homebrew-cask(Homebrewの拡張でWebから落としてきてインストールする様なソフトを 自動でインストール)
# - 「brew cask edit google-chrome」などで、オプション変更可能
# - ダウンロード可能アプリの一覧は「brew cask search」にて



tap  'phinze/homebrew-cask'
brew 'brew-cask'
brew 'gnu-sed --default-names'
#cask 'dropbox'
#cask 'omnigraffle'
#cask 'parallels-9'
#cask 'phpstorm'
#cask 'sequel-pro'
#cask 'x-quartz'
cask 'adobe-air'
cask 'alfred'
cask 'bartender'
cask 'bathyscaphe'
cask 'bettertouchtool'
cask 'camtasia'
cask 'clipmenu'
cask 'codekit'
cask 'evernote'
cask 'fluid'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'forklift'
cask 'google-chrome'
cask 'google-chrome-canary'
cask 'google-perftools'
cask 'google-web-designer'
cask 'intellij-idea-ultimate'
cask 'iterm2'
cask 'keyremap4macbook'
cask 'libreoffice'
cask 'livereload'
cask 'marked2'
cask 'mysql-workbench'
cask 'path-finder'
cask 'quickcast'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'rcdefaultapp'
cask 'redis-desktop-manager'
cask 'reflector'
cask 'silverlight'
cask 'skype'
cask 'splashtop-streamer'
cask 'totalfinder'
cask 'vagrant'
cask 'versions'  # Subversion Client
cask 'virtualbox'
cask 'vlc'
casl 'appcleaner'

tap  'jimbojsb/launchrocket'
cask 'launchrocket'

# 以下のApplicationは、現状Caskが無いので、手動でInstallする
# - Adobe CC
# - Adobe Flash Player
# - Elasticfox-ec2tag
# - Gyazo gif
# - Gyazo
# - GlyphDesigner
# - IAMFox
# - MS Office
# - ParticleDesigner
# - R53Fox
# - Unity Web Player
# - cooviewer
# - Lingr
# app list generate command
# $ diff -y <(mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ;}' | sort) <( ls /Applications| grep '.app' | sort) | grep '>' | awk '{for( i = 2; i < NF; i++ ){printf( "%s ", $i );}print $NF;}' | awk '{sub(".app","")}{print}' | egrep -v 'Safari|iTune|Time Machine|Mail|Reminders|QuickTime|Preview|Photo Booth|Notes|App Store|Automator|Calculator|Dictionary|Dashboard|DVD Player|FaceTime|Game Center|Image Capture|Messages|Mission Control|Calendar|Chess|Contacts|Launchpad|Stickies'

