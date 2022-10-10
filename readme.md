# macOS setup

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
 # brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

 # git install
brew install git
mkdir -p ~/Github/syotaro/dotfiles/.config/git
ln -s    ~/GitHub/syotaro/dotfiles/.config/git/config ~/.config/git/config
ln -s    ~/GitHub/syotaro/dotfiles/.config/git/ignore ~/.config/git/ignore

 # zshのプロファイルにパスを通す
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

 # 現在のセッションにHomebrewのパスを認識させる
eval "$(/opt/homebrew/bin/brew shellenv)"

 # install fish
brew install fish

 # fishのパスを確認
which fish   # => /opt/homebrew/bin/fish

 # ログインシェルをfishに変更
chsh -s /opt/homebrew/bin/fish
   # =>Changing shell for <ユーザー名>.
   # =>Password for <ユーザー名>:

 # ログインシェルとして有効なシェルにfishを追加
sudo vi /etc/shells # 最終行に、/opt/homebrew/bin/fish を追記

 # 設定ファイルを配置
cp -f ~/GitHub/syotaro/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

 # fishのプラグイン(fisher)install
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jethrokuan/z
fisher install 0rax/fish-bd
brew install fzf
fisher install fisherman/fzf

 # vscodeのターミナルシェル連携の設定
 # => https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
```

## anyenv

```sh
brew install anyenv
anyenv install --init
anyenv install --list
anyenv install nodenv
nodenv install 16.14.0
nodeenv global 16.14.0
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update

anyenv install rbenv
rbenv install 3.1.2
rbenv global 3.1.2
```

## その他の CLI

```sh
 # github
brew install gh
gh auth login
gh auth status
 # tree
brew install tree
 # agコマンド
brew install the_silver_searcher
 # terraform
brew install terraform
```

## fish の補完を最適化する為、CLI help を fish にロード

```sh
fish_update_completions
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
- [Java](https://www.java.com/ja/download/)

### SSH key

```sh
  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*

  # 1password CLI
  # => 1passwrod に格納された SSH 秘密鍵を用いて、ssh 接続できるようにする。また、その際生体認証も有効にする → 機密性と便利性の両立の為
  # => https://1password.com/downloads/command-line/
  # => https://developer.1password.com/docs/ssh/get-started/

```

### フォント

- https://fonts.google.com/specimen/BIZ+UDGothic

## NVIM

- 事前に iTerm2 をインストールしておく(デフォルトのターミナルだと、TrueColor 非対応につき、アイコンが文字化けする為)

```sh
 # NERDフォントをインストール
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd


 # NVIM本体をインストール
brew install git ctags
brew install neovim
brew install neovim-qt
python3 -m pip install --user --upgrade pynvim


 # NVIMの設定を時短するため、AstroNvimをインストール
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git checkout nightly # nvim0.8.0対応のためにnightlyへ
nvim +PackerSync
 # 設定ファイルをコピー
mkdir -p ~/.config/nvim/lua/user/
ln -s ~/GitHub/syotaro/dotfiles/.config/nvim/lua/user/nightly.init.lua ~/.config/nvim/lua/user/init.lua
 # 必要な設定を確認
nvim
:checkhealth provider
:Mason
  # =>Installed
  # =>  ✓ css-lsp
  # =>  ✓ cssmodules-language-server
  # =>  ✓ eslint-lsp
  # =>  ✓ json-lsp
  # =>  ✓ lua-language-server
  # =>  ✓ prettier
  # =>  ✓ rubocop
  # =>  ✓ solargraph
  # =>  ✓ stylua
  # =>  ✓ terraform-ls
  # =>  ✓ typescript-language-server
 # Syntax（TreeSitter）の設定確認
:TSInstallInfo
:Copilot setup   #=> 自身のgithub ユーザ名が表示されること
:Copilot status  #=> Copilot: Enabled and online
:Copilot version #=> Nodeのバージョンが17以上必須
```

## macOS config

```sh
 # h、j、k、および l の移動キーを押したままにしても繰り返されない問題の修正
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
 # スクリーンショットのファイル名固定文字列を削除
defaults write com.apple.screencapture name ""
```

## そのほか

- prettier で md 自動フォーマット時に日本語と英語の間にスペース入ってしまう問題
  - https://github.com/prettier/prettier/pull/11597

## vim 操作のメモ

- NormalMode で
  - <C-o> :元いた場所に戻る
  - <C-i> :元いた場所に進む
- 編集モードで
  - <C-o> :一時的にノーマルモードになり、一回だけコマンドを実行できる
  - Escape key: jj, jk
