# import
source ~/.zshrc.alias
source ~/.zshrc.aws
if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi
export PATH=/usr/local/bin:/usr/local/share:/usr/local/sbin:/usr/local/share:$PATH


HISTFILESIZE=50000
HISTTIMEFORMAT='%Y-%m-%d %T '; export HISTTIMEFORMAT
export CLICOLOR="yes"
export HISTIGNORE=ls:history
export HISTSIZE=5000
export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]' # less のステータス行にファイル名と行数、いま何%かを表示するようにする。
export PAGER=lv                                                         # man とかを見るときはいつも less を使う。
export RSYNC_RSH=ssh                                                    # rsync では ssh を使う。
shopt -s histappend                                                     # 履歴ファイルを上書きではなく追加する。
shopt -s no_empty_cmd_completion                                        # なにも入力してないときはコマンド名を補完しない。

#################################### PROMPT
u2=`expr $USER : '\(..\).*'`   # ホスト名とユーザ名の先頭 2文字をとりだす。全部だと長いので。
                               # 現在のホストによってプロンプトの色を変える。
case "$HOSTNAME" in
  *Moba*) col=31;;             # 赤
  *Gree*) col=36;;             # 水色
  *Mixi*) col=33;;             # 黄
  *local*) col=35;;            # 紫
  *) col=1;;                   # それ以外のホストでは強調表示
esac

export PS1="\$u2@\[\033[1;${col}m\]\H\[\033[0m\][\W]\$ "

