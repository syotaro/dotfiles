
[ -f ~/.zprezto/runcoms/zshrc ] && source ~/.zprezto/runcoms/zshrc
[ -f ~/.zshrc.custom ]          && source ~/.zshrc.custom

case $(uname -s) in
    Darwin|FreeBSD)
        [ -f ~/.zshrc.osx     ] && source ~/.zshrc.custom.osx
        [ -f ~/.zshrc.aws     ] && source ~/.zshrc.custom.aws
    ;;
    Linux)
    ;;
esac



[ -f ~/.zshrc.local ] && source ~/.zshrc.local
