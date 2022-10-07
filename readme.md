# 端末 setup

## mac OS 関連

- OS update
- 設定 > キーボード
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
% echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
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
 # 設定ファイルを配置
% cp -f ~/GitHub/syotaro/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
 # fishのプラグインinstall
 # fisherのインストール
% curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
% fisher install jethrokuan/z
% fisher install 0rax/fish-bd
% brew install fzf
% fisher install fisherman/fzf

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
% brew install git
% ls ~/Github/syotaro/dotfiles/.config/git
 # github
% brew install gh
% gh auth login
% gh auth status
 # tree
% brew install tree
 # agコマンド
% brew install the_silver_searcher
```

## システムにインストールされているマニュアルページを fish に読み込む

```sh
% fish_update_completions
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

- https://fonts.google.com/specimen/BIZ+UDGothic

## NVIM

- 事前に iTerm2 をインストールしておく(デフォルトのターミナルだと、TrueColor 非対応につき、アイコンが文字化けする為)

```sh
 # NERDフォントをインストール
% brew tap homebrew/cask-fonts
% brew install font-hackgen
% brew install font-hackgen-nerd


 # NVIM本体をインストール
% brew install git ctags
% brew install neovim
% brew install neovim-qt
% python3 -m pip install --user --upgrade pynvim


 # NVIMの設定を時短するため、AstroNvimをインストール
% git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
% nvim +PackerSync

 # AstroNVIMのカスタム設定をバックアップして、アップデート
cp -f ~/.config/nvim/lua/default_theme/base.lua  ~/GitHub/syotaro/dotfiles/.config/nvim/lua/default_theme/base.lua
cp -f ~/.config/nvim/init.lua  ~/GitHub/syotaro/dotfiles/.config/nvim/init.lua
cp -f ~/.config/nvim/lua/core/mappings.lua  ~/GitHub/syotaro/dotfiles/.config/nvim/lua/core/mappings.lua
:AstroUpdate

 # 必要な設定を確認
% nvim +checkhealth provider
 # LSPをインストール(AstroNvimのメニューから)
    ✓ solargraph
    ✓ cssmodules-language-server
    ✓ eslint-lsp
    ✓ lua-language-server
    ✓ prettier
    ✓ rubocop
    ✓ typescript-language-server

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
