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

- Upgrade Yosemite & Reboot & hold Command + R & Disk Utility -> ディスクの検証 -> Erase & Install Yosemite

### Install Dropbox

- [Dropbox](https://www.dropbox.com/home)   # 個人用、会社用、両方ともlinkさせる
- [Alfred App](http://www.alfredapp.com/)
- [Chrome ](https://www.google.com/chrome/browser/desktop/#eula)
- [Chrome Canary](https://www.google.com/chrome/browser/canary.html)

### Install Apps (via AppStore)

```sh
    # => manually
    # app list generate command
    # => $ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort
1Password
CloudPlay
Color Picker
ColorSchemer Studio
Desktop Calendar Plus
Explainer
Kaleidoscope
LINE
Murasaki
Navicat Premium Essentials
NeverSleep
NewsBar
Paw
Pixelmator
Pushbullet
Reeder
Remote Desktop
Revisions      # Dropbox revision manager(diff integrate Kaleidoscope)
Sketch         # http://www.vandelaydesign.com/sketch-plugins-for-designers/
Skitch
Slack
The Archive Browser
Transmit
Tweetbot
Ultra Character Map          # Symbol Icon Viewer
Visits
WhiteNoise
WinArchiver
Xcode
iKeyboard
    # Microsoft Remote Desktop
```

### Setup symblic link

- cloudDefinition
  - iCloud Drive -> all device sync     # for selfTemplate & authEnv files!
  - dropbox      -> file archive module # for product files module. like Gem!
  - github       -> sourceCode
  - everNote     -> MyknowledgeBase
  - googleDrive  -> shareDocs

```sh
  # setup dotfiles
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/ ~/dotfiles
cd ~/dotfiles
sh ./deploy-dotfiles-all.sh
  # easy access
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ ~/icloudDrive
ln -sf ~/dropbox\ \(個人\)/ ~/dropbox
  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
  # setup aws key
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/aws ~/.aws
  # setup eb
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/elasticbeanstalk ~/.elasticbeanstalk
  # setup td key
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/td ~/.td
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/google/.google-api.yaml ~/.google-api.yaml
```
### Install homebrew

```sh
  # Install Require Tools
open /Applications/Xcode.app
java -version                # => Java Install manually
sudo xcodebuild -license
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
cd     ~/dotfiles
sh     brewfile.sh
brew   update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew   cask alfred link
brew   linkapps
  # 英語版msOffice2011を日本語に対応させる
open /Applications/Microsoft\ Office\ 2011/Additional\ Tools/Microsoft\ Language\ Register/Microsoft\ Language\ Register.app
```
- (option)open Package
  - open /opt/homebrew-cask/Caskroom/\*/\*/\*.pkg

### Install Manually

- R53fox
- ElasticFox

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

### Install rbenv

- 導入の理由
  - 複数の Ruby バージョンをインストールして管理したい
  - root領域を汚したくない(ユーザ領域にinstall)

```sh
brew install 'openssl'
brew install 'readline'
brew install 'rbenv' 'ruby-build'
rbenv install 2.1.5
rbenv versions
rbenv global  2.1.5
rbenv rehash
exec $SHELL -l  # restart Shell
   # gem
gem update rake
gem install bundler
cd ~/dotfiles/
bundle install
```
### Configure vim & install vim plugin

- .vimrcBase [vim-bootstrap.com](http://vim-bootstrap.com/)

```sh
   # Pre-requisites
brew install git
brew install ctags
   # plugin
vim +NeoBundleInstall +qall
```

### Install Quicklook Plugin

```sh
# brew install ffmpeg --with-tools media-info
# brew cask install 'betterzipql'
# brew cask install 'qlcolorcode'
# brew cask install 'qlvideo'
# brew cask install 'qlmarkdown'
# brew cask install 'qlprettypatch'
# brew cask install 'qlstephen'       # view plain text files without a file extension
brew cask install 'quicklook-csv'
# brew cask install 'quicklook-json'
# brew cask install 'webp-quicklook'
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
- Navicat > Navicat Cloud Sign in
- TeamViewer > sign in
- Evernote > Env > Shortcut > disable all
- System Preference
  `open -a "system preferences"`
  - Login Items
    - Flux
    - Alfred
    - Dropbox
    - Karabiner
    - WitchDaemon
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
brew install python

  # AWS CLI
sudo easy_install pip
sudo pip install awscli
pip install awscli --upgrade
vim ~/.aws/credentials
aws ec2 describe-instances --profile default | jq '.'
aws s3 ls --profile default
  # AWS EB 3.x CLI
sudo pip install awsebcli

  # markdown for evervim
sudo pip install markdown
```

### Install other

```sh
  # pandoc (via Haskell-Platform)
brew install ghc cabal-install
brew cask install 'haskell-platform'     # Install until the end, very time-consuming
cabal    update
cabal    install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
  # BOWER
brew install node.js
npm install -g bower
```

### install Atom Plugin

```sh
apm install term2
apm install vim-mode
apm install file-icons
apm install minimap
apm install localization
apm install project-manager
apm install color-picker
apm install atom-color-highlight
```
