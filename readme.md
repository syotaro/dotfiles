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


### Configure OSX

```bash
rm ~/Downloads/.localized | rm ~/Documents/.localized | rm ~/Applications/.localized | rm ~/Desktop/.localized | rm ~/Library/.localized | rm ~/Movies/.localized | rm ~/Pictures/.localized | rm ~/Music/.localized | rm ~/Public/.localized
killall Finder
```


### Install Apps (via AppStore)

```sh
    # => manually
    # app list generate command
    # => $ mdfind "kMDItemAppStoreHasReceipt=1" | awk -F \/ '{ print $3 ; }' | awk '{sub(".app","")}{print}' | sort

brew install 'argon/mas/mas'
524576324 SmartZipper Pro
587512244 Kaleidoscope
539883307 LINE
409183694 Keynote
411246225 Caffeine
407963104 Pixelmator
584653203 Paw
466416967 Navicat Premium Essentials
443987910 1Password
409203825 Numbers
497799835 Xcode
557168941 Tweetbot
403388562 Transmit
409201541 Pages
408981434 iMovie
948415170 Pushbullet
462227149 Visits
852320343 Sketch
803453959 Slack
520265986 Ultra Character Map
824171161 Affinity Designer
```

### Setup symblic link

- cloudDefinition
  - iCloud Drive -> all device sync     # for Personal
  - dropbox      -> file archive module # for product files module. like Gem!
  - github       -> sourceCode
  - everNote     -> MyknowledgeBase
  - googleDrive  -> # for JobProducts
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
brew install 'readline'
brew install 'rbenv' 'ruby-build'
brew install 'openssl'
rbenv install --list
brew upgrade ruby-build
rbenv install 2.3.1  # rbenv local 2.3.1
rbenv versions
rbenv global  2.3.1
rbenv rehash
exec $SHELL -l  # restart Shell
   # gem
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
pip install neovim
```

### Install Quicklook Plugin

```sh
brew cask install 'quicklook-csv'
qlmanage -r
qlmanage -r cache
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
```

### Configure Other Apps (Manual)

- 1Password > Enable integration with 3rd party apps
- Google Japanese IME > Dict import
- Google Japanese IME > KeySetting Kotoeri > ATOK
- 英かな



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
