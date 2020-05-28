
## OSX setup flow

### HDD CleanUP

- Upgrade Yosemite & Reboot & hold Command + R & Disk Utility -> ディスクの検証 -> Erase & Install
- sign in apple id


### Configure OSX

```bash
rm ~/Downloads/.localized | rm ~/Documents/.localized | rm ~/Applications/.localized | rm ~/Desktop/.localized | rm ~/Library/.localized | rm ~/Movies/.localized | rm ~/Pictures/.localized | rm ~/Music/.localized | rm ~/Public/.localized
killall Finder
```

### Install Apps (via AppStore)

- Application
  - Adobe Creative Cloud
  - Apple Configurator 2
  - BusyContacts
  - Chatwork
  - Cyberduck→google cloud storage
  - Discord
  - Karabiner-Elements
  - Kindle
  - LINE
  - Local by Flywheel
  - Messenger
  - Microsoft Excel
  - Microsoft PowerPoint
  - Microsoft Teams
  - Microsoft Word
  - Navicat Premium Essentials
  - OneDrive
  - Postman
  - Remote Desktop
  - Stoplight Studio
  - Transmit
  - Typora
  - WorkSpaces
  - Wrike for Mac
  - Xcode
  - busycal
  - chrome
  - github desktop
  - macvim
  - newsbar
  - slack
  - spotify
  - twitter Typora
  - zoom
  - 1Password 7
  - Airtable
- Chrome アプリ
  - Chrome リモート デスクトップ
  - Gatsby
  - WordPress.com
- JetBrains Toolbox
  - DataGrip
  - PhpStorm
  - RubyMine
  - WebStorm

### Setup symblic link

```sh
  # setup dotfiles
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/ ~/dotfiles
cd ~/dotfiles
sh ./deploy-dotfiles-all.sh
  # easy access
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ ~/icloudDrive
  # setup ssh key
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
sudo xcodebuild -license
xcode-select --install
  # Install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew   doctor
brew   install git
brew   update
```

### Install Apps (via homebrew or other)

- [syotaro/dotfiles/brewfile.sh](https://github.com/syotaro/dotfiles/blob/master/brewfile.sh)

```sh
brew install 'z'
```

- [google SDK](https://cloud.google.com/sdk/downloads?hl=ja)

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
  # Change shell(bash -> zsh)
cat /etc/shells
```

### Configure vim & install vim plugin

- install https://github.com/splhack/macvim-kaoriya
- フォントはsource code Pro 等を利用　https://github.com/powerline/fonts
- .vimrcBase [vim-bootstrap.com](http://vim-bootstrap.com/)

```sh
   # Pre-requisites
brew install ctags
brew install 'macvim'
   # plugin
vim +PlugInstall +qall
```

### Configure Other Apps (Manual)

- 1Password > Enable integration with 3rd party apps
- 英かな
  - ![](https://docs.google.com/drawings/d/e/2PACX-1vQsYdl_2dBPDAGda40og3Ovs-C2V9mzefiOdYUUe7jsuGy_rGQvMCqbIYmAc9MVkmULR4fNnkTeQTll/pub?w=657&h=691)



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
