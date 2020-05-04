[ -f ~/.zprezto/runcoms/zshrc ] && source ~/.zprezto/runcoms/zshrc
[ -f ~/.zshrc.local ]           && source ~/.zshrc.local

case $(uname -s) in
    Darwin|FreeBSD)
        [ -f ~/.zshrc.local.alias   ] && source ~/.zshrc.local.alias
        # [ -f ~/.zshrc.local.aws     ] && source ~/.zshrc.local.aws
        [ -f ~/.zshrc.local.chpwd   ] && source ~/.zshrc.local.chpwd
        # [ -f ~/.zshrc.local.iterm   ] && source ~/.zshrc.local.iterm
        [ -f ~/.zshrc.local.k       ] && source ~/.zshrc.local.k
        [ -f ~/.zshrc.local.osx     ] && source ~/.zshrc.local.osx
        [ -f ~/.zshrc.local.rbenv   ] && source ~/.zshrc.local.rbenv
        [ -f ~/.zshrc.local.udc     ] && source ~/.zshrc.local.udc
        [ -f ~/.zshrc.local.peco    ] && source ~/.zshrc.local.peco
        # [ -f ~/.zshrc.local.android ] && source ~/.zshrc.local.android
    ;;
    Linux)
    ;;
esac


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shotaro/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shotaro/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shotaro/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shotaro/google-cloud-sdk/completion.zsh.inc'; fi
