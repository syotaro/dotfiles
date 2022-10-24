# macOS setup

## macOS 関連

- OS update
- 設定 > キーボード
  - CapsLockをControlキーにマッピング
  - ユーザー辞書
    - 全部チェック外す
  - 入力ソース
    - 日本語の、下記のチェックを外す
      - タイプミスを修正
      - 推測候補表示
      - 数字を全角入力

## CLI（homebrew & fish）

```bash
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
fisher install ilancosman/tide@v5

 # vscodeのターミナルシェル連携の設定
 # => https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
```

## anyenv

```bash
brew install anyenv
anyenv install --init
anyenv install --list
anyenv install nodenv
nodenv install 16.14.0
nodeenv global 16.14.0
  # Verify that nodenv is properly set up using this nodenv-doctor script:
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash


mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update

anyenv install rbenv
rbenv install 3.1.2
rbenv global 3.1.2
```

## その他の CLI

```bash
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

## fish の補完を最適化するため、CLIhelp を fish にロード

```bash
fish_update_completions
```

## GUI アプリのインストール

- AppStore
  - Kaleidoscope.app
  - DevUtils.app
  - LottieFiles.app
  - MeetingBar.app
  - Microsoft Excel.app
  - Microsoft PowerPoint.app
  - Microsoft Word.app
  - Slack.app
  - Xcode.app
  - LINE.app
  - Kindle.app
- Other
  - 1Password.app
  - AWS VPN Client.app
  - Alfred.app
  - Asana.app
  - Binance.app
  - Busycal.app
  - Canva.app
  - Cyberduck ※for google cloud storage.app
  - DeepL.app
  - Docker.app
  - Easy Move+Resize.app
  - Figma.app
  - Github desktop.app
  - Google Chrome.app
  - Google Drive.app.app
  - Karabiner-Elements.app
  - Messanger.app
  - Postman.app
  - Visual Studio Code.app
  - iTerm.app
  - zoom.us.app

## GUI 設定

- chrome
  - chrome://flags/#following-feed-sidepanel
  - chrome://flags/#desktop-partial-translate
- macOS設定
  - 通知
    - 音は鳴らさない
- [github CLI設定](https://docs.github.com/ja/desktop/installing-and-configuring-github-desktop/overview/launching-github-desktop-from-the-command-line)

## SSH key(今後は不要かも。ほぼ利用しない)

```bash
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

## AWS 鍵の配置(vscode toolkitなどから利用する)

```bash
ln -s ~/Documents/config/aws  ~/.aws
```

## フォント

- <https://fonts.google.com/specimen/BIZ+UDGothic>

## NVIM

- 事前にiTerm2をインストールしておく(デフォルトのターミナルだと、TrueColor非対応につき、アイコンが文字化けするため)

```bash
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
ln -s ~/GitHub/syotaro/dotfiles/.config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua
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

```bash
 # h、j、k、および l の移動キーを押したままにしても繰り返されない問題の修正
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false  # For vscode
 # スクリーンショットのファイル名固定文字列を削除
defaults write com.apple.screencapture name ""
 # ネットワーク上にDS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
```

## cspell

- 事前に、vscodeの拡張機能をインストールしておく

```bash
 # vscodeのcspellの辞書ファイルを、icloudに同期させる
unlink ~/.cspell/custom-dictionary-user.txt
rm ~/.cspell/custom-dictionary-user.txt
ln -s ~/Documents/config/cspell/custom-dictionary-user.txt ~/.cspell/
```

## textlint

```bash
  # global
npm install --location=global textlint
npm install textlint-plugin-html
npm install --location=global textlint-rule-preset-smarthr
npm install --location=global textlint-rule-preset-ja-technical-writing
ln -s ~/GitHub/syotaro/dotfiles/.textlintrc ~/.textlintrc
  # リポジトリ
npm install --save-dev textlint
npm install --save-dev textlint-rule-preset-smarthr
npx textlint --init  # => .textlintrc が生成される
```

## prettier

```bash
  # これはいらないかも
brew install prettier
brew install fsouza/prettierd/prettierd
```

- prettierでmd自動フォーマット時に日本語と英語の間にスペース入ってしまう問題
  - <https://github.com/prettier/prettier/pull/11597>

```bash
  # global
npm install --location=global prettier
npm install --location=global prettier-plugin-md-nocjsp
ln -s ~/GitHub/syotaro/dotfiles/.prettierrc.js ~/.prettierrc.js   # エラー回避で必要だった
  # リポジトリ
npm install --location=global prettier
npm install --location=global prettier-plugin-md-nocjsp
vim ./prettierrc.js  # うまく設定しないと、prettier-plugin-md-nocjspがちゃんとロードされない
```

## markdownlint

```bash
  # global
ln -s ~/GitHub/syotaro/dotfiles/.markdownlintrc ~/.markdownlintrc
  # リポジトリ
  # =>プロジェクトのworkspace_directoryに置く場合は.markdownlint.jsoncという名前にする。
```

## vscodeの心得

- textlint拡張は、ワークスペースを開いていないと、サーバーエラーになる

## セキュリティの心得

- Wifiの自動接続は無効にする（信頼するネットワークだけ自動接続は可能）
- 暗号化されていないWi-Fiスポットを利用しない
- ファイアウォールは有効にする

## vim 操作のメモ 2

- NormalModeで
  - C-o :元いた場所に戻る
  - C-i :元いた場所に進む
  - K: カーソル位置の関数のドキュメントを表示
  - C-w: ウインドウ操作
  - C-q: 強制的に終了
  - [ ] : カーソル操作
- 編集モードで
  - C-o :一時的にノーマルモードになり、一回だけコマンドを実行できる
  - Escape key: jj, jk
- Copilotキーマップ ※<M-x>はMetaキー。iTerm2で、Profile>Keys>General>Left Option keyでEsc+設定が事前に必要
  - 提案を入力する: `<Tab>`
  - 提案を却下する: `<C-]>`
  - 次の提案に移る: `<M-]>`
  - 前の提案に移る: `<M-[>`

## macの操作メモ

- opt+cmd+d →OSdock ON/OFF
- opt+cmd+g →Gdriveランチャー
