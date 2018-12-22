source ~/.profile
# use zsh
#if [ -f /bin/zsh ]; then
#    exec /bin/zsh
#fi

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
