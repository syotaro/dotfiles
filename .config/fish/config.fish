# メッセージを消す
set fish_greeting

# LSCOLORS
export LSCOLORS=Gxfxcxdxbxegedabagacad

# ターミナルの256色表示
export TERM=xterm-256color

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

#ALIAS
alias tree='tree -a -I "\.DS_Store|\.git|node_modules|cdk.out|venv|package|vendor\/bundle" -N'
alias v="nvim"
alias vv="nvim -c 'Telescope oldfiles'"
alias vim="nvim"
alias gs='git status -sb -uall'
alias l='ls -ThA'
alias gd='git diff'
alias e='exa -la'
alias c='code'
alias gcd='cd "$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"'  # git root


if status is-interactive
    # Commands to run in interactive sessions can go here
    source (/opt/homebrew/bin/brew shellenv|psub)
    source (/opt/homebrew/bin/anyenv init - fish|psub)
end

string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)

