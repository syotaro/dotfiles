# 端末setup

## mac OS関連

- update
- キーボード
    - CapsLockをControlキーにマッピング
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
% cat ~/.config/fish/config.fish

# メッセージを消す
set fish_greeting

# LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

#ALIAS
alias tree='tree -a -I "\.DS_Store|\.git|node_modules|cdk.out|venv|package|vendor\/bundle" -N'

if status is-interactive
    # Commands to run in interactive sessions can go here
    source (/opt/homebrew/bin/brew shellenv|psub)
    source (/opt/homebrew/bin/anyenv init - fish|psub)
end
```

```sh
# fishのプラグインinstall
# fisherのインストール
> curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
> fisher install jethrokuan/z
> fisher install 0rax/fish-bd
> brew install fzf
> fisher install fisherman/fzf

```

## anyenv

```sh
> brew install anyenv
> anyenv install --init
> anyenv install --list
> anyenv install nodenv
> nodenv install 16.14.0
> nodeenv global 16.14.0
> mkdir -p $(anyenv root)/plugins
> git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
> anyenv update
```

## その他のCLI

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

## システムにインストールされているマニュアルページをfishに読み込む

``sh
> fish_update_completions

### GUIアプリのインストール

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

### SSH key

```sh
  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```

### フォント

https://fonts.google.com/specimen/BIZ+UDGothic

## VIM

```sh
% brew install git ctags
% brew install neovim
% python3 -m pip install --user --upgrade pynvim
# https://vim-bootstrap.com/ # コマンドなどは、READMEに書いてある
% mv ~/Downloads/generate.vim $XDG_CONFIG_HOME/nvim/init.vim

```
