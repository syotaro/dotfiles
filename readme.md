# 端末 setup

## mac OS 関連

- update
- キーボード
  - CapsLock を Control キーにマッピング
  - ユーザ辞書
    - 全部チェック外す
  - 入力ソース
    - 日本語の、下記のチェックを外す
      - タイプミスを修正
      - 推測候補表示
      - 数字を全角入力

## CLI（homebrew & fish） 

```sh
# install
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# zshのプロファイルにパスを通す
% echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /<ホームディレクトリ>/.zprofile
# 現在のセッションにHomebrewのパスを認識させる
% eval "$(/opt/homebrew/bin/brew shellenv)"

# install fish
% brew install fish
# fishのパスを確認
% which fish
  /opt/homebrew/bin/fish
# ログインシェルをfishに変更
% chsh -s /opt/homebrew/bin/fish
  Changing shell for <ユーザー名>.
  Password for <ユーザー名>:
# ログインシェルとして有効なシェルにfishを追加
% sudo vi /etc/shells # 最終行に、/opt/homebrew/bin/fish を追記
```

```sh
# fishの設定
## 設定のバックアップ
cp -ip ~/.config/fish/config.fish                         ~/GitHub/syotaro/dotfiles/.config/fish/config.fish
## 設定のリストア
cp -ip ~/GitHub/syotaro/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

```

```sh
# fishのプラグインinstall
# fisherのインストール
> curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
> fisher install jethrokuan/z
> fisher install 0rax/fish-bd
> brew install fzf
> fisher install fisherman/fzf

# vscodeのターミナルシェル連携の設定
# https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
```

## anyenv

```sh
% brew install anyenv
% anyenv install --init
% anyenv install --list
% anyenv install nodenv
% nodenv install 16.14.0
% nodeenv global 16.14.0
% mkdir -p $(anyenv root)/plugins
% git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
% anyenv update

% anyenv install rbenv
% rbenv install 3.1.2
% rbenv global 3.1.2
```

## その他の CLI

```sh
 # git
> brew install git
> git config --global user.name "syotaro"
> git config --global user.email "<GitHubアカウントのメールアドレス>"
> mkdir -p ~/.config/git/
> echo .DS_Store > ~/.config/git/ignore
> cat ~/.config/git/ignore
.DS_Store

 # github
> brew install gh
> gh auth login
> gh auth status

 # git-secrets
> brew install git-secrets

# AWSアクセスキーの標準パターンをGitの設定ファイルに書き込む
> git secrets --register-aws --global
OK

# ~/.gitconfig が更新されたことを確認
> cat ~/.gitconfig

# リポジトリ用のGit hooksを ~/.git-templates/git-secrets にインストール
> git secrets --install ~/.git-templates/git-secrets
✓ Installed commit-msg hook to /<ホームディレクトリ>/.git-templates/git-secrets/hooks/commit-msg
✓ Installed pre-commit hook to /<ホームディレクトリ>/.git-templates/git-secrets/hooks/pre-commit
✓ Installed prepare-commit-msg hook to /<ホームディレクトリ>/.git-templates/git-secrets/hooks/prepare-commit-msg

# インストールしたテンプレートを読み込む
> git config --global init.templatedir '~/.git-templates/git-secrets'

```

```sh
> brew install tree
```

## システムにインストールされているマニュアルページを fish に読み込む

```sh
> fish_update_completions
```

### GUI アプリのインストール

- 1Password
- AWS VPN Client
- Alfred 5
- Canva
- Cyberduck ※for google cloud storage
- Google Drive.app
- Karabiner-Elements
- LINE
- MeetingBar
- Shifter
- Xcode
- busycal
- chrome
- github desktop
- slack
- zoom.us
- devutils

### SSH key

```sh
  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```

### フォント

https://fonts.google.com/specimen/BIZ+UDGothic # GUI 用
https://github.com/yuru7/udev-gothic # CUI 用

$ brew tap homebrew/cask-fonts
$ brew install font-hackgen
$ brew install font-hackgen-nerd

## NVIM

```sh
% brew install Alacritty
% vim ~/.config/alacritty/alacritty.yml
% git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
% nvim +PackerSync
```


```sh
% brew install git ctags
% brew install neovim
% brew install neovim-qt
% python3 -m pip install --user --upgrade pynvim
 # vim-bootstrap.comから基本設定をDL
% curl 'https://vim-bootstrap.com/generate.vim' --data 'editor=nvim&theme=molokai&langs=javascript&langs=typescript&langs=html&langs=ruby' > ~/.config/nvim/init.vim
 # カスタム設定を配置
% cp -ip ~/GitHub/syotaro/dotfiles/.config/nvim/local_bundles.vim  ~/.config/nvim/local_bundles.vim
% cp -ip ~/GitHub/syotaro/dotfiles/.config/nvim/local_init.vim     ~/.config/nvim/local_init.vim
 # 必要な設定を確認(vimを開いて実行)
% :checkhealth provider
```

```sh
# 言語サーバー
gem install neovim
gem environment
gem install solargraph
gem install rubocop
nvim # → :CocInstall coc-solargraph

```

## Java & Xcode

https://www.java.com/ja/download/

## 1password CLI

1passwrod に格納された SSH 秘密鍵を用いて、ssh 接続できるようにする。また、その際生体認証も有効にする → 機密性と便利性の両立の為
https://1password.com/downloads/command-line/
https://developer.1password.com/docs/ssh/get-started/

## macOS config

h、j、k、および l の移動キーを押したままにしても繰り返されない問題の修正

```sh
% defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
```
