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

- Reboot & hold Command + R & Disk Utility -> Erase & Install Yosemite

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
Airmail 2
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
GarageBand
GistPal
Gistify
SmartPlayer
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
SoraAnnai
Templates for Office Pro
The Archive Browser
TimeWorks
Translate Tab
Transmit
Tuba
Tweetbot
Unclutter
Visits
VisualDiffer
VisualGrep
WebCode
WhiteNoise
WinArchiver
Witch
WordService
Xcode
iKeyboard
iMovie
iPhoto
iTranslate
xScope
```

### Setup ssh key

```sh
ln -sf ~/Dropbox\ \(個人\)/ ~/Dropbox
mkdir ~/.ssh
ln -s ~/Dropbox/work/setting/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```
### Install homebrew

```sh
  # Install
ruby   -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew   doctor
brew   install git
brew   update
```

### Install Apps (via homebrew or other)

```sh
    # Install Require Tools
open /Applications/Xcode.app
java -version                # => Java Install manually
xcodebuild -license
xcode-select --install
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

### Setup dotfiles

```sh
mkdir ~/dotfiles &&  cd ~/dotfiles
git clone git@github.com:syotaro/dotfiles.git .
sh ./deploy-dotfiles-all.s
  # replace Dropbox
mv dotfiles /tmp
ln -sf ~/Dropbox/work/github/dotfiles ~/dotfiles
```

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
brew install rbenv ruby-build
   # Install Ruby 2.1.3 and set it as the default version
rbenv install 2.1.3
rbenv global  2.1.3   # ruby -v  =>  ruby 2.1.3
   # インストールしたrubyやgemのパスを通す
rbenv rehash
```

```sh
   # gem
gem update --system
gem update rake
gem install bundler
bundle install
```
### Configure vim & install vim plugin

Referenced [vim-bootstrap.com](http://vim-bootstrap.com/)

```sh
   # Pre-requisites
brew install git
brew install ctags
   # plugin
mv ~/Downloads/vimrc ~/.vimrc
vim +NeoBundleInstall +qall
```

```sh
   # Gist-vim
curl -i -u "GITHUB-USERNAME" -d '{"scopes":["gist"],"note":"gist vim"}' https://GITHUB-DOMAIN/api/v3/authorizations # => copy token param
vim ~/.gist-vim            # => set token
chmod 600 ~/.gist-vim
```

### BOWER

```sh
brew install node.js
npm install -g bower
```

### Install Quicklook Plugin

```sh
brew update; brew upgrade brew-cask
brew cask install qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
brew install ffmpeg --with-tools media-info
cp -rf ~/dotfiles/Library/QuickLook/* ~/Library/QuickLook
qlmanage -r
qlmanage -r cache
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
```

### Configure Other Apps (Manual)

- System Preference
- Finder Preference
- Alfred2 > Syncing
- BetterTouchTools
- Karabiner > Emacs binding for Excel
- Karabiner > Emacs Mode > Delete,Reterm Up/Down/Left/Right
- Karabiner > for Japanese > コマンドキーの動作を優先モードv1
- Unclutter
- Google Japanese IME > KeySetting Kotoeri > ATOK
- Google Japanese IME > Dict import
- Kaleidoscope
- TeamViewer
- 1Password    > Enable integration with 3rd party apps
- Office Excel > disable check logic
- Office PowerPoint
- Login Items
  - Flux
  - Alfred
  - Dropbox
  - Karabiner
  - WitchDaemon
  - TotalFinder
  - BetterTouchTool

## Install AWS CLI

```sh
sudo easy_install pip
sudo pip install awscli
sudo pip install awscli --upgrade
vim ~/.aws/keys/awscli.conf
aws ec2 describe-instances | jq '.'
aws s3 ls
```

### python markdown for evervim

```sh
sudo pip install markdown
```

### Configure OSX

- Configure by TinkerTool

```sh
ksdiff ~/dotfiles/Library/ ~/Library
  # cd ~/dotfiles
  # sh ./osx.sh
```

### Install pandoc (via Haskell-Platform)

```sh
install 'haskell-platform'     # Install until the end, very time-consuming
cabal    update
cabal    install pandoc
export PATH=${HOME}/.cabal/bin:$PATH
```
