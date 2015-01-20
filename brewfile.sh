#!/bin/bash

set -e
############################################
# Add Repository
############################################
#tap  home/dupes               || true
#tap phinze/homebrew-cask       || true
brew tap caskroom/homebrew-versions || true  # add beta pkg
brew tap homebrew/binary            || true
brew tap jimbojsb/launchrocket      || true
brew tap homebrew/science           || true
#update || true


############################################
# Add Packages for Development
############################################
brew install brew-cask
brew cask install 'xquartz'         # 依存されてるので先にInstall
brew install 'R'                    # required https://xquartz.macosforge.org/landing/
brew install 'autoconf'
brew install 'automake'
brew install 'bash'
brew install 'android-sdk'
brew install 'bdw-gc'
brew install 'cmake'                # be require from mysql
brew install 'colordiff'
brew install 'coreutils'
brew install 'cscope'
brew install 'ctags'
brew install 'curl'                 # ln -s ` --prefix curl`/bin/curl /usr/local/bin
brew install 'ffmpeg'               # require by youtube-dl
brew install 'gdbm'
brew install 'gettext'
brew install 'gh'
brew install 'glib'
brew install 'gmp'
brew install 'gnu-sed' '--default-names'
brew install 'go'
brew install 'goaccess'
brew install 'graphicsmagick'
brew install 'heroku-toolbelt'
brew install 'htop-osx'
brew install 'hub'                  # wrapper for  git command
brew install 'icu4c'
brew install 'imagemagick' '--disable-openmp'
brew install 'jenkins'
brew install 'jpeg'
brew install 'jq'                   # JSONパーサー
brew install 'jsonpp'
brew install 'libevent'
brew install 'libffi'
brew install 'libpng'
brew install 'libtool'
brew install 'libxml2'  # for nokogiri
brew install 'libxslt'  # for nokogiri
brew install 'libyaml'
brew install 'lua'
brew install 'lv'
brew install 'lynx'
brew install 'macvim' '--with-lua --override-system-vim --custom-icons'
brew install 'multitail'
brew install 'mysql-connector-odbc' # for Tableau
brew install 'ngrep'
brew install 'nkf'
brew install 'nmap'                 # port scan util
brew install 'npm'
brew install 'oniguruma'
brew install 'pidof'
brew install 'pkg-config'
brew install 'pstree'
brew install 's3cmd'
brew install 'sqlite'
#brew install 'ssh-copy-id'          # ローカルの公開鍵を対象のサーバに配置する ex) ssh-copy-id user@server
brew install 'sshrc'                # sshした先で読み込む環境変数をローカルで定義できる
brew install 'tcpflow'              # いい感じでHTTPリクエストをモニタリング
brew install 'termshare'            # ローカルのターミナル状況をブラウザでシェア
brew install 'the_silver_searcher'
brew install 'tree'
brew install 'unixodbc'
brew install 'w3m'                  # CLI Web Browser
brew install 'watch'
brew install 'wget' '--enable-iri'
brew install 'xz'
brew install 'youtube-dl'           # youtube downloader
brew install 'z'
brew install 'zsh' '--disable-etcdir'
#install 'bsdmake'
#install 'freetype'
#install 'fuse4x'
#install 'fuse4x-kext'
#install 'weechat' '--with-ruby --with-python --with-perl'
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
brew install 'tmux'
brew install 'reattach-to-user-namespace'
################
#  Bench Mark
################
#brew install 'siege'
################
#  Git
################
brew install 'git'
brew install 'git-flow'
brew install 'tig'   # cli git browser
################
#  MySQL
################
brew install 'mysql'
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
brew install 'sdl'
################
#  CSVTOOL
################
#install opam
# opam install csv

############################################
#  Cask          - 「 cask edit google-chrome」などで、オプション変更可能
############################################
#install brew-cask || true

brew cask install 'adobe-air'
brew cask install 'android-file-transfer'
brew cask install 'appcleaner'
brew cask install 'bathyscaphe'          # 2ch ブラウザ
brew cask install 'bettertouchtool'
brew cask install 'camtasia'             # 動画キャプチャ(mac,iPhoneの録画)、AnimationGIFのexport、
brew cask install 'chefdk'               # Chef Development Kit
brew cask install 'cooviewer'
brew cask install 'android-studio'
brew cask install 'licecap'              # GIFアニメキャプチャ
brew cask install 'evernote'             # AppStore版だと、Spotlight検索に対応してないので、Download版で入れること
brew cask install 'flash-player'
brew cask install 'flashlight'           # adds plugins to Spotlight
#brew cask install 'fluid'
brew cask install 'flux'
brew cask install 'geektool'
brew cask install 'google-drive'
brew cask install 'google-japanese-ime'
brew cask install 'hockeyapp'            # アプリのβ版配付
brew cask install 'iterm2'
brew cask install 'karabiner'
brew cask install 'ksdiff'
brew cask install 'launchrocket'
brew cask install 'marked'
brew cask install 'microsoft-office'
brew cask install 'omnifocus'
brew cask install 'omnigraffle'
brew cask install 'openemu-experimental'
brew cask install 'owncloud'
brew cask install 'pixel-winch'
brew cask install 'rubymine'
brew cask install 'silverlight'
brew cask install 'skype'
brew cask install 'stay'                 # Window位置の記憶
brew cask install 'tableau'
brew cask install 'teamviewer'
brew cask install 'testflight'
brew cask install 'tinkertool'           # osx カスタマイズ
brew cask install 'today-scripts'        # geektoolの通知センター対応版
# brew cask install 'totalfinder'
# https://github.com/tue-savvy/SimulatorManager
brew cask install 'sourcetree'
brew cask install 'unity-web-player'
brew cask install 'vagrant'
brew cask install 'vagrant-manager'
brew cask install 'virtualbox'
# https://github.com/cookpad/iam-fox
# https://github.com/cookpad/elasticfox-ec2tag
# https://github.com/cookpad/r53-fox
#brew cask install 'LightPaper'           # MarkdownEditor
#brew cask install 'adobe-creative-cloud' # open  '/opt/homebrew-cask/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
#brew cask install 'alfred'
#brew cask install 'amazon-cloud-drive'
#brew cask install 'clipmenu'
#brew cask install 'cloudytabs'
#brew cask install 'codekit'
#brew cask install 'dropbox'
#brew cask install 'forklift'
#brew cask install 'google-chrome'          # 手動で実体を/Applicationsフォルダに設置したほうがよい。でないと、1PasswordのExtentionが正常に動かない
#brew cask install 'google-chrome-canary'
#brew cask install 'google-web-designer'
#brew cask install 'gyazo'
#brew cask install 'intellij-idea'
#brew cask install 'keycue'
#brew cask install 'libreoffice'
#brew cask install 'mysqlworkbench'
#brew cask install 'omnipresence'
brew cask install 'path-finder'
#brew cask install 'perian'
#brew cask install 'phpstorm'
#brew cask install 'postbox'
#brew cask install 'rcdefaultapp'
#brew cask install 'redis-desktop-manager'
#brew cask install 'reflector'
#brew cask install 'rstudio'
#brew cask install 'sequel-pro'
#brew cask install 'soundflower'
#brew cask install 'vlc'
#brew cask install 'vmware-fusion'

############################################
# Remove outdated versions
###########################################e
brew linkapps
brew cleanup
