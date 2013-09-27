export TERM=xterm-256color
# case ${UID} in
# 0)
#     LANG=C
#     ;;
# esac







######################################################################## history
export HISTFILE=~/.zsh_history           # historyファイル
export HISTIGNORE=ls:history
export HISTSIZE=10000                    # ファイルサイズ
export HISTTIMEFORMAT='%Y-%m-%d %T '     # bashのhistory zshのfc -ifldで使用する時刻フォーマット
export SAVEHIST=10000                    # saveする量
setopt EXTENDED_HISTORY                  # zshの開始終了を記録
setopt extended_history                  # 履歴ファイルに時刻を記録
setopt hist_ignore_dups                  # 重複を記録しない
setopt hist_reduce_blanks                # スペース排除
setopt inc_append_history                # 履歴をインクリメンタルに追加
setopt ignore_eof       # Ctrl+D では終了しないようになる（exit, logout などを使う）
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'       # 単語の区切り指定
# setopt share_history                     # 履歴ファイルを、全ターミナルで共有

######################################################################## basic
#autoload predict-on;predict-on                      # 先方予測機能
# setopt auto_cd                                      # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
# setopt correct                                      # コマンドの自動修正
autoload -U compinit
compinit
# compinit -u                                           # 強力な補完機能
# compinit -i                                           # 強力な補完機能
setopt autopushd                                      # cd でTabを押すとdir list を表示
setopt brace_ccl                                      # {a-c} を a b c に展開する機能を使えるようにする
setopt complete_in_word                               # カーソル位置で補完する
setopt list_packed                                    # リストを詰めて表示
setopt list_types                                     # 補完一覧ファイル種別表示
setopt print_eight_bit                                # 日本語ファイル名を表示可能に
setopt pushd_ignore_dups                              # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt complete_aliases                               # aliased ls needs if file/dir completions work
setopt no_beep
setopt rm_star_wait                                   # ファイルの一括削除時に１０秒間停止する
stty stop undef                                       # ctrl-sを押した時に入力がfreezeするのを解除


########################################################################  source

[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zshrc.theme ] && source ~/.zshrc.theme
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


########################################################################  osx
case $(uname -s) in
    Darwin|FreeBSD)
        [ -f ~/.zshrc.osx     ] && source ~/.zshrc.osx
        [ -f ~/.zshrc.aws     ] && source ~/.zshrc.aws
        export LANG="ja_JP.UTF-8"
        export LANGUAGE="ja_JP.UTF-8"
        export LC_ALL="ja_JP.UTF-8"
        export HOMEBREW_CASK_OPTS="--appdir=/Applications"
        export PATH="$HOME/.osx/local/bin:$PATH"

    ;;
    Linux)
        export LANGUAGE=en_US.UTF-8
        export LANG=en_US.UTF-8
        export LC_ALL=en_US.UTF-8
    ;;
esac

########################################################################  お試し期間中設定

export XDEBUG_CONFIG="idekey=DBGP"
export XDEBUG_SESSION_START=DBGP


#export PATH=/usr/local/share/zsh/site-functions/:$PATH   # emmet livestyle


# Gist
export GITHUB_URL=https://git.gree-dev.net/


export MAKEOPTS="-j4"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
eval "$(hub alias -s)"
