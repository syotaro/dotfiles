[ -f ~/.zprezto/runcoms/zshrc ] && source ~/.zprezto/runcoms/zshrc
[ -f ~/.zshrc.local ]           && source ~/.zshrc.local

case $(uname -s) in
    Darwin|FreeBSD)
        [ -f ~/.zshrc.local.osx     ] && source ~/.zshrc.local.osx
        [ -f ~/.zshrc.local.aws     ] && source ~/.zshrc.local.aws
        [ -f ~/.zshrc.local.docker  ] && source ~/.zshrc.local.docker
        [ -f ~/.zshrc.local.udc     ] && source ~/.zshrc.local.udc
        [ -f ~/.zshrc.local.chpwd   ] && source ~/.zshrc.local.chpwd
        [ -f ~/.zshrc.local.alias   ] && source ~/.zshrc.local.alias
        [ -f ~/.zshrc.local.iterm   ] && source ~/.zshrc.local.iterm
        [ -f ~/.zshrc.local.k       ] && source ~/.zshrc.local.k
    ;;
    Linux)
    ;;
esac
