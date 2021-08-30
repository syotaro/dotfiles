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
- Canva
- Cyberduck ※for google cloud storage
- Google Drive.app
- Karabiner-Elements
- LINE
- Local by Flywheel
- MeetingBar
- Messenger
- Microsoft Excel
- Microsoft PowerPoint
- Microsoft Teams
- Microsoft Word
- TablePlus
- Remote Desktop
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


### Setup CLI

```sh
  # homebrew
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*

brew   doctor
brew   install git composer
brew   update
```

### Setup zsh

```bash
brew install 'z'
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


### install cli

```bash
brew install 'peco'
brew install 'ffmpeg'
```
