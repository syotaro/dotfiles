# macOS setup

## macOS 関連

- OS update
- 設定
  - キーボード
    - CapsLockをControlキーにマッピング
    - ユーザー辞書
      - 全部チェック外す
    - 入力ソース
      - 日本語の、下記のチェックを外す
        - タイプミスを修正
        - 推測候補表示
        - 数字を全角入力
    - 通知
      - 音は鳴らさない
    - サウンド
      - 入力
        - 外付けディスプレイ(Studio Display)が選択されていることを確認
        - 入力音量は最大
      - 出力
        - 外付けディスプレイ(Studio Display)が選択されていることを確認
      - 「メニューバーにサウンドを表示」にチェック

## CLI（homebrew）

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
```

## CLI(fish)

```bash
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
ln -s ~/GitHub/syotaro/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

 # fishのプラグイン(fisher)install
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jethrokuan/z
fisher install 0rax/fish-bd
brew install fzf
fisher install fisherman/fzf
fisher install ilancosman/tide@v5
 # fish の補完を最適化するため、CLIhelp を fish にロード
fish_update_completions
 # vscodeのターミナルシェル連携の設定
 # => https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
 # => やるとなんかshellでEnter連打でエラー出るのでやらない方がいい
```

## CLI(anyenv)

```bash
brew install anyenv
anyenv install --init
anyenv install --list
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update
```

## CLI(nodenv on anyenv)

- 事前にnodeのLTS（長期サポートバージョン）を確認しておく

```bash
 # global
npm root --location=global
npm bin --location=global
node -e "console.log(global.module.paths)"
 # current dir
npm root
anyenv install nodenv
nodenv install --list
nodenv versions
  # => * system (set by /Users/syotaro/.anyenv/envs/nodenv/version)
nodenv install 16.18.0
nodenv global 16.18.0
npm install yarn
  # Verify that nodenv is properly set up using this nodenv-doctor script:
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

ln -s ~/GitHub/syotaro/dotfiles/package.json ~/
ln -s ~/GitHub/syotaro/dotfiles/package-lock.json ~/
```

## CLI(ruby version manager)

- 事前に <https://www.ruby-lang.org/en/downloads/> から安定版のバージョンを確認しておく

```bash
anyenv install rbenv
rbenv install --list
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
 # xcode関連CLI
xcode-select --install
 # exa
brew install exa
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

## GUI アプリ設定

- chrome
  - chrome://flags/#following-feed-sidepanel
  - chrome://flags/#desktop-partial-translate
- [github CLI 設定](https://docs.github.com/ja/desktop/installing-and-configuring-github-desktop/overview/launching-github-desktop-from-the-command-line)

## SSH key(今後は不要かも。ほぼ利用しない)

```bash
  # setup ssh key
mkdir ~/.ssh
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ssh/* ~/.ssh/
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*

  # 1password CLI
  # => 1password に格納された SSH 秘密鍵を用いて、ssh 接続できるようにする。また、その際生体認証も有効にする → 機密性と便利性の両立の為
  # => https://1password.com/downloads/command-line/
  # => https://developer.1password.com/docs/ssh/get-started/

```

## AWS 鍵の配置(vscode toolkit などから利用する)

```bash
ln -s ~/Documents/config/aws  ~/.aws

cat ~/.aws/config
  # [default]
  # region = ap-northeast-1
  # # mfa_serial = arn:aws:iam::{account_number}:mfa/{login_user_name}
  # # role_arn = arn:aws:iam::{account_number}:role/{admin_role_name}
  # # source_profile = login_user
  #
  # # [profile login_user]
  # # region = ap-northeast-1

cat ~/.aws/credentials
  # # Created by AWS Toolkit for VS Code. https://aws.amazon.com/visualstudiocode/
  # [default]
  # aws_access_key_id = XXXXXXXXXXXXXXXXXX
  # aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXX
```

## NVIM

- 事前にiTerm2をインストールしておく(デフォルトのターミナルだと、TrueColor非対応につき、アイコンが文字化けするため)

```bash
 # NERD対応フォントをインストール
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd
brew font-udev-gothic
brew font-udev-gothic-nf

 # NVIM本体をインストール
brew install git ctags
brew install neovim
python3 -m pip install --user --upgrade pynvim
npm install  --location=global neovim
 # NVIMの設定を時短するため、AstroNvimをインストール
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
 # 設定ファイルをコピー
mkdir -p ~/.config/nvim/lua/user/
ln -s ~/GitHub/syotaro/dotfiles/.config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua
 # 必要な設定を確認
nvim
:checkhealth provider
:checkhealth mason
:Mason
  # =>Installed
  # cspell                      # 前提：globalで cspellコマンドが実行できること
  # cssmodules-language-server  #
  # eslint-lsp                  #
  # json-lsp                    #
  # lua-language-server
  # markdownlint                #
  # prettier                    # formatter
  # rubocop                     # Linter
  # ruby-lsp
  # solargraph
  # spectral-language-server
  # stylelint-lsp
  # terraform-ls                # Terraform Formatter
  # textlint                    # 自然言語Linter
  # tflint                      # Terraform Linter
  # typescript-language-server
 # Syntax（TreeSitter）の設定確認
:TSInstallInfo
 # github Copilotの設定確認
:Copilot setup   #=> 自身のgithub ユーザ名が表示されること
:Copilot status  #=> Copilot: Enabled and online
:Copilot version #=> Nodeのバージョンが17以上必須
```

## macOS config

```bash
 # h、j、k、および l の移動キーを押したままにしても繰り返されない問題の修正
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false  # For vscode
 # スクリーンショットのファイル名固定文字列を削除
defaults write com.apple.screencapture name "ss"
 # ネットワーク上にDS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
```

## cspell config

- 事前に、vscodeとnvim側の設定は完了しているものとする

```bash
 # vscodeとnvimのcspellのファイルと辞書ファイル(辞書には機密が記載されている可能性があるので、icloudと同期）
npm install --location=global cspell
mkdir ~/.cspell
ln -s ~/Documents/config/cspell/custom-dictionary-user.txt ~/.cspell/custom-dictionary-user.txt
ln -s ~/GitHub/syotaro/dotfiles/.cspell/cspell.json        ~/.cspell/cspell.json
```

## textlint

```bash
  # global
npm install --location=global textlint
npm install --location=global textlint-plugin-html
npm install --location=global textlint-rule-preset-smarthr
npm install --location=global textlint-rule-preset-ja-technical-writing
ln -s ~/GitHub/syotaro/dotfiles/.textlintrc ~/.textlintrc
```

- textlint拡張は、ワークスペースを開いていないと、サーバーエラーになる

## prettier

```bash
  # global
npm install  --location=global prettier
# npm install  --location=global prettier-plugin-md-nocjsp
ln -s ~/GitHub/syotaro/dotfiles/.prettierrc.js ~/.prettierrc.js   # 日本語と英語の間にスペース入ってしまう問題の回避&quickfix:trueにしないと、nvimがバグるので
ln -s ~/GitHub/syotaro/dotfiles/.prettierrc.vscode.js ~/.prettierrc.vscode.js  # vscodeでquickfixが有効だと動かないので
```

- [prettier で md 自動フォーマット時に日本語と英語の間にスペース入ってしまう問題](https://github.com/prettier/prettier/pull/11597)

## markdownlint

```bash
  # global
npm install markdownlint-cli2 --global
ln -s ~/GitHub/syotaro/dotfiles/.markdownlintrc ~/.markdownlintrc
  # => jsonc形式っぽいのに、末尾のカンマがあると、エラーになるので注意
```

- リポジトリ内で利用する場合は、.markdownlint.jsoncという名前にする。

## セキュリティの心得

- Wifiの自動接続は無効にする（信頼するネットワークだけ自動接続は可能）
- 暗号化されていないWi-Fiスポットを利用しない
- ファイアウォールは有効にする

## AstroNvim 操作のメモ

- NormalModeで
  - C-o :元いた場所に戻る
  - C-i :元いた場所に進む
  - K: カーソル位置の関数のドキュメントを表示
  - C-w: ウインドウ操作
  - C-q: 強制的に終了
  - [ ] : カーソル操作
  - = : インデントを揃える
  - iはカーソル位置から入力開始。
  - aはカーソルの次の位置から入力開始。
  - oはカーソルの次の行の先頭から入力開始。
  - Iは行の先頭から入力開始。
  - Aは行の終わりから入力開始。
  - Oはカーソルの前の行の先頭から入力開始。
  - Window操作
    - left window you need to press Ctrl + h
    - right window you need to press Ctrl + l
  - タブ操作
    - left buffer you need to press Shift + h
    - right buffer you need to press Shift + l
  - Opening terminal: To toggle terminal you need to press F7
  - Opening LSP symbols: To toggle symbols outline you need to press Space + lS
  - Close buffer: To close the current buffer you need to press Space + c
  - Commenting: To comment on a one or multiple lines you need to press Space + /
  - Show line diagnostics: To see line diagnostics you need to press g + l
  - Hover document: To hover over a document you need to press Shift + k
  - Open rename prompt: To open rename prompt you need to press Space + lr
  - Go to definition: To go to the definition you need to press g + d
  - Telescope git status: To get git status you need to press Space + gt
  - Telescope old files: To find old files you need to press Space + fo
  - Escape key jj, jk
  - Force Write Ctrl + s
  - Force Quit Ctrl + q
  - Close Buffer Space + c
  - Comment Space + /

- 編集モードで
  - C-o :一時的にノーマルモードになり、一回だけコマンドを実行できる
  - Escape key: jj, jk
- Copilotキーマップ※<M-x>はMetaキー。
  - 提案を入力する: `<Tab>`
  - 提案を却下する: `<C-]>`
  - 次の提案に移る: `<M-]>`
  - 前の提案に移る: `<M-[>`
- Insertモード
  - Ctrl+tやCtrl+dでインデント

## Nvim のキャッシュクリア

```bash
mv ~/.local/share/nvim  /tmp/localsharenvm
mv ~/.cache/nvim /tmp/cachenvim
nvim +PackerSync
```

## mac の操作メモ

- opt+cmd+d →OSdock ON/OFF
- opt+cmd+g →Gdriveランチャー
- opt+F1 → 設定(照度調整)
- opt+F9 → 設定(音声入力)

## mac で、slack や vscode で`Command + [`や`Shift+Command+[`のショートカットキーが効かなくなる問題

- 以下のショートカットをなにか別のものに変えた後、OSを再起動する。
  - システム環境設定->キーボード->ショートカット->キーボード->次のウインドウを操作対象にする

## iTerm.app 設定

- Advanced > Mouse > Always accept first mouse event on terminal windows > Noに変更
  - これをNoにすると、iTermアクティブ化の為の最初のマウスクリックで、カーソルが移動しない
- Profile > Keys > General > Left Option keyでEsc+設定
  - これを設定すると、左OptionキーがVimのMetaキーとして利用できる
