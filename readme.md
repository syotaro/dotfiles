```sh
  # Back up the previous environment
$ gem list
$ brew list
$ brew cask list
$ defaults read
$ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
and check Files other than Dropbox(Recommended TimeMachine!)
```

## OSX setup flow

### HDD CleanUP

- Updade Yosemite & Reboot & hold Command + R & Disk Utility -> Erase & Install Yosemite

### Install Dropbox

- [Dropbox](https://www.dropbox.com/home)
- [Alfred App](http://www.alfredapp.com/)
- [Chrome ](https://www.google.com/chrome/browser/desktop/#eula)
- [Chrome Canary](https://www.google.com/chrome/browser/canary.html)

### Install Apps (via AppStore)

```sh
    # => manually
    # app list generate command
    # => $ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
1Password
2D Grapher
AnyVideo Converter HD
App Language Chooser
Artboard
Asset Catalog Creator
Astro
Briefs
Cinemagraph Pro
CloudPlay
Cobook
CodeRunner
ColorSchemer Studio
Current
Dash
DateLine
Deliveries
Desktop Calendar Plus
Easy Image Converter
Elastics
Explainer
Export Calendars Pro
Friends export
GCalToolkit
GIFBrewery                   # Gif Anime Converter
GarageBand
GistPal
Gistify
GraphicConverter 9
Hexels Pro
IMAGEmini
Icon Slate
Infographics
JPEGmini
JSON Editor
JenkinsNotifier
Kaleidoscope
Kaomoji Lover
Keynote
Kobito
LINE
MathGraph
Microsoft Remote Desktop
Movist
Murasaki
MyAScript
Navicat Data Modeler
Navicat Premium Essentials
Navicat for MySQL
Nephorider
NeverSleep
New Relic Menu Bars
NewsBar
Numbers
OmniGraphSketcher
OmniOutliner Pro
OmniPlan
Orrery
PDF2Office for OmniGraffle
PNG Compressor
PageLayers
Pages
PaintCode
PasteAsFile
Patterns
Paw
Pixelmator
QuickHub
RankGuru SEO
Reeder
Remote Desktop
Revisions      # Dropbox revision manager(diff integrate Kaleidoscope)
Sketch
Skitch
Slack
SmartPlayer
SoraAnnai
Templates for Office Pro
The Archive Browser
TimeWorks
Translate Tab
Transmit
Tuba
Tweetbot
Ultra Character Map          # Symbol Icon Viewer
Visits
VisualDiffer
VisualGrep
WebCode
WhiteNoise
WinArchiver
WordService
World Clock
Xcode
iKeyboard
iMovie
iPhoto
iTranslate
xScope
```

### Setup symblic link

- iCloud Drive -> all device sync     # for selfTemplate & authEnv files!
- Dropbox      -> file archive module # for product files module. like Gem!

```sh
  # setup dotfiles
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/ ~/dotfiles
cd ~/dotfiles
sh ./deploy-dotfiles-all.sh
  # easy access
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ ~/icloudDrive
ln -sf ~/dropbox\ \(個人\)/ ~/dropbox
  # Setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```
### Install homebrew

```sh
  # Install Require Tools
open /Applications/Xcode.app
java -version                # => Java Install manually
xcodebuild -license
xcode-select --install
  # Install
ruby   -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew   doctor
brew   install git
brew   update
```

### Install Apps (via homebrew or other)

- [syotaro/dotfiles/brewfile.sh](https://github.com/syotaro/dotfiles/blob/master/brewfile.sh)

```sh
    # Install apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew   install caskroom/cask/brew-cask
sh     brewfile.sh
brew   update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew   cask alfred link
brew   linkapps
```
- (option)open Package
  - open /opt/homebrew-cask/Caskroom/\*/\*/\*.pkg

### Setup zsh

```sh
  # Prezto(ZshFramework)
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
unlink ~/.zshrc
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
unlink ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```
```sh
  # Change shell(bash -> zsh)
chsh -s /bin/zsh
cat /etc/shells
```

### Install Ruby

```sh
brew install 'openssl'
brew install 'readline'
brew install 'ruby-build' --HEAD
   # Install Ruby 2.1.3 and set it as the default version
rbenv install 2.1.3
#rbenv global  2.1.3   # ruby -v  =>  ruby 2.1.3
   # インストールしたrubyやgemのパスを通す
#rbenv rehash
   # gem
gem update --system
gem update rake
gem install bundler
bundle install
```
### Configure vim & install vim plugin

- Referenced [vim-bootstrap.com](http://vim-bootstrap.com/)

```sh
   # Pre-requisites
brew install git
brew install ctags
   # plugin
mv ~/Downloads/vimrc ~/.vimrc
vim +NeoBundleInstall +qall
```

### Install Quicklook Plugin

```sh
brew update; brew upgrade brew-cask
brew install ffmpeg --with-tools media-info
brew cask install 'betterzipql'
brew cask install 'qlcolorcode'
brew cask install 'qlvideo'
brew cask install 'qlmarkdown'
brew cask install 'qlprettypatch'
brew cask install 'qlstephen'       # view plain text files without a file extension
brew cask install 'quicklook-csv'
brew cask install 'quicklook-json'
brew cask install 'webp-quicklook'
cp -rf ~/dotfiles/osx_library/QuickLook/* ~/Library/QuickLook/
qlmanage -r
qlmanage -r cache
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
```

### Configure Other Apps (Manual)

- 1Password > Enable integration with 3rd party apps
- BetterTouchTools
- Finder Preference
- Google Japanese IME > Dict import
- Google Japanese IME > KeySetting Kotoeri > ATOK
- iTerm 2 > Preferences > Browse
- iTerm 2 > iTerm > Make iTerm2 Default Term
- Kaleidoscope
- Karabiner > Emacs Mode > Delete,Reterm Up/Down/Left/Right
- Karabiner > Emacs binding for Excel
- Karabiner > for Japanese > コマンドキーの動作を優先モードv1
- Office Excel > disable check logic
- Office PowerPoint
- TeamViewer
- Tower > gitconfig
- System Preference
  `open -a "system preferences"`
  - Login Items
    - Flux
    - Alfred
    - Dropbox
    - Karabiner
    - WitchDaemon
    - TotalFinder
    - BetterTouchTool
  - Keyboard > Shortcut
- osx
  - Configure by TinkerTool
  - Configure by OnyX
  - Library
    ```sh
    ksdiff ~/dotfiles/osx_library/ ~/Library
      # cd ~/dotfiles
      # sh ./osx.sh
    ```
  - Driver
    - http://www.pfu.fujitsu.com/hhkeyboard/macdownload.html
- Image Capture > 左下のオプションから、「iPhoneを接続時に開くアプリケーション」を、「割り当て無し」に

### System Asset
- Font > ICON > http://zavoloklom.github.io/material-design-iconic-font/icons.html#hardware
- Font > ICON > http://fortawesome.github.io/Font-Awesome/
- Font > ICON > http://www.flaticon.com/categories/
- Font > ICON > https://github.com/cognitom/symbol-font-in-web
- Font > ICON > https://octicons.github.com/
- Font > ICON > https://www.iconfinder.com/
- Font > ICON > Ultra Character Map ![](http://s3img.jp/20141222134835.png)
- Font > EssentialPragmataPro for Powerline
- Font > http://www.masuseki.com/index.php?u=my_works/121003_mitimasu.htm  # みちます
- Font > Favorite > みちます、fontawesome、メイリオ
- Colors > ![](https://dl.dropboxusercontent.com/u/12750454/screenshots/20141222134906.png)

### osx performance tuninng

- 通知センターの項目を減らす
- ディスクのアクセス権の検証
- ディスプレイの透明度を下げる

### Install Python Lib

```sh
  # AWS CLI
sudo easy_install pip
sudo pip install awscli
sudo pip install awscli --upgrade
vim ~/.aws/keys/awscli.conf
aws ec2 describe-instances | jq '.'
aws s3 ls
  # markdown for evervim
sudo pip install markdown
```

### Install other

```sh
  # pandoc (via Haskell-Platform)
brew install 'haskell-platform'     # Install until the end, very time-consuming
cabal    update
cabal    install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
  # BOWER
brew install node.js
npm install -g bower
```
