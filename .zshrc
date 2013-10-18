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
autoload -Uz compinit
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

[ -f ~/.zshrc.theme ] && source ~/.zshrc.theme
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


########################################################################  osx
case $(uname -s) in
    Darwin|FreeBSD)
        [ -f ~/.zshrc.osx     ] && source ~/.zshrc.osx
        [ -f ~/.zshrc.aws     ] && source ~/.zshrc.aws
        export LANG="ja_JP.UTF-8"
        export LANGUAGE="ja_JP.UTF-8"
        # export LC_ALL="ja_JP.UTF-8"
        # export LANGUAGE=en_US.UTF-8
        # export LANG=en_US.UTF-8
        # export LC_ALL=en_US.UTF-8
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

case $(uname -s) in
    Darwin)

[ -d $HOME/.rbenv/ ]  && export MAKEOPTS="-j4"
[ -d $HOME/.rbenv/ ]  && export PATH="$HOME/.rbenv/bin:$PATH"
[ -d $HOME/.rbenv/ ]  && export PATH="$HOME/.rbenv/shims:$PATH"
[ -d $HOME/.rbenv/ ]  && eval "$(rbenv init - zsh)"

[ -d $HOME/.phpenv/ ] && export PATH=$PATH:$HOME/.phpenv/bin:$HOME/.phpenv/versions/5.4.16/bin
[ -d $HOME/.phpenv/ ] && eval "$(phpenv init - zsh)"

    ;;
esac

########################################################################  Alias

case $(uname -s) in
    Darwin|FreeBSD)  # osx
        alias l="ls"
        alias ls="ls -ahwG"
        alias ll="ls -alhG"
        # sublime text 2
        alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
        alias subll='st .'
        # github
        alias hb='hub browse'
        # less syntax
        alias less="/usr/share/vim/vim73/macros/less.sh"
        # vim
        alias v=' /Applications/MacVim.app/Contents/MacOS/Vim'
        alias vi=' /Applications/MacVim.app/Contents/MacOS/Vim'
        alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
        alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g '
        alias pbc='pbcopy'
        alias ql='qlmanage -p '
    ;;
    Linux)      # Debian
        alias ls="ls --color=always -ahF"
        alias ll="ls --color=always -alhF"
        alias vi="vim"
        alias v="vim"
    ;;
    NetBSD|OpenBSD)
        alias ls="ls -ahF"
        alias ls="lsl -alhF"
    ;;
esac


# sudoするときに、環境設定を引き継ぐ
alias sudo='sudo -E '

# Unix Command

alias d='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'   # 前に行ったディレクトリに移る
alias grep="grep --color=auto"
alias top='top -ocpu'
alias rm="rm -i"
alias mv="mv -i"
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
# tmux
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tr='tmux rename-session -t'


# ag
alias ag='ag -S --stats'
alias agh='ag --hidden'

# add datetime
alias history="history -i" 


# rails
#alias rc='rails console'
#alias rd='rails destroy'
#alias rdb='rails dbconsole'
#alias rdbm='rake db:migrate db:test:clone'
#alias rg='rails generate'
#alias rgm='rails generate migration'
#alias rp='rails plugin'
#alias ru='rails runner'
#alias rs='rails server'
#alias rsd='rails server --debugger'
#alias rld='tail -f log/development.log'
#alias rdm='rake db:migrate'
#alias rdr='rake db:rollback'


# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'
alias pfind='find . -name "*.php" | xargs grep -n --color=auto'


# git
alias g='git'
alias gs='git status -s -b'
# alias gst='git status -s -b'
alias gd='git diff'
# alias gba='git branch -a'
# alias g='cd   $(git rev-parse --show-toplevel)'
alias gcd='cd $(git rev-parse --show-toplevel)'




