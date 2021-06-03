
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

- 1Password
  - 1password.comと連携
- Adobe Creative Cloud
- AWS VPN Client
- Alfred 4
  - clipboard有効化
    - plain text→1ヶ月
    - keep images
    - keep file list
    - ホットキー変更→ control + n
  - web bookmark有効化
- Apple Configurator 2
- BusyContacts
- Canva
- Cyberduck ※for google cloud storage
- Discord
- Karabiner-Elements
- LINE
- Local by Flywheel
- MeetingBar
- Messenger
- Microsoft Excel
- Microsoft PowerPoint
- Microsoft Teams
- Microsoft Word
- Navicat Premium Essentials / TablePlus / Sequel Pro
- Postman
- Remote Desktop
- Stoplight Studio
- Transmit
- WinArchiver
- WordPress.com
- WorkSpaces
- Xcode
- busycal
- chrome
- github desktop
- macvim
- newsbar
- slack
- Vimeo.app
- twitter
- zoom.us


### Setup symblic link

```sh
  # 事前にgithub DesktopでDocumentフォルダにdotfiles.gitをcloneしておく
  # setup dotfiles
ln -sf /Users/shikilab/Documents/GitHub/dotfiles/ ~/dotfiles
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
cd /opt
sudo mkdir homebrew
sudo chown $USER:admin homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

brew   doctor
brew   install git composer
brew   update
```

### Install Apps (via homebrew or other)

```sh
$ brew install 'z'
```

- [google SDK](https://cloud.google.com/sdk/downloads?hl=ja)

### Setup zsh

```bash
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

### フォント
brew tap homebrew/cask-fonts
brew install --cask font-hackgen
brew install --cask font-hackgen-nerd

### Vim

- install https://github.com/splhack/macvim-kaoriya
- [vim-bootstrap.com](http://vim-bootstrap.com/)

```bash
   # Pre-requisites
brew install ctags
brew install 'macvim'
   # plugin
vim +PlugInstall +qall
```

### Configure Other Apps

- 1Password > Enable integration with 3rd party apps


### install cli

```bash
brew install 'peco'
brew install 'ffmpeg'
```


