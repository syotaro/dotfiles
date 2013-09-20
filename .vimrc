
"------------------------------------
" 初期化
"------------------------------------
autocmd!

"------------------------------------
" Vundle Setup                                                                  {{{
"------------------------------------
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

" Edit
    " NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
    NeoBundle 'Changed'
    NeoBundle 'Gundo'                                   " undo履歴を追える
    " NeoBundle 'SQLUtilities'
    NeoBundle 'Shougo/neocomplete'                      " 補完。luaが必要
    NeoBundle 'Shougo/neosnippet'                       " neocomplcacheのsinpet補完
    NeoBundle 'Shougo/vimfiler'
    NeoBundle 'VOoM'                                    " Vim Outliner of Markers
    " NeoBundle 'bash-support.vim'
    NeoBundle 'joonty/vdebug.git'
    NeoBundle 'itchyny/lightline.vim'
    " NeoBundle 'sandeepcr529/Buffet.vim'
    NeoBundle 'git://github.com/itspriddle/vim-marked.git'
    NeoBundle 'git://github.com/jimsei/winresizer.git'
    NeoBundle 'git://github.com/tpope/vim-surround.git' " テキストを括弧で囲む／削除する
    NeoBundle 'h1mesuke/vim-alignta.git'                " 整形プラグイン Alignのマルチバイト対応版
    NeoBundle 'html5.vim'
    NeoBundle 'kwbdi.vim'                               " keep Window on Buffer Delete
    " NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'mattn/emmet-vim'
    " NeoBundle 'mattn/livestyle-vim'
    NeoBundle 'molokai'
    NeoBundle 'tell-k/vim-browsereload-mac'
    NeoBundle 'tomtom/tcomment_vim'                     " コメント処理 \c<Space>
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tyru/vim-altercmd'
    NeoBundle 'yuratomo/w3m.vim.git'
  " NeoBundle 'Auto-Pairs'
  " NeoBundle 'Indent-Guides'
  " NeoBundle 'Quich-Filter'
  " NeoBundle 'Shougo/vimshell.git'
  " NeoBundle 'YankRing.vim'                            " YankRing.vim : ヤンクの履歴を管理し、順々に参照、出力できるようにする
  " NeoBundle 'css_color.vim'
  " NeoBundle 'eregex.vim'
  " NeoBundle 'git://github.com/thinca/vim-showtime.git'
  " NeoBundle 'grep.vim'
  " NeoBundle 'kana/vim-fakeclip'                " OS のクリップボードやら GNU Screen のバッファを yank, paste できる
  " NeoBundle 'kannokanno/previm'                       " markdown preview
  " NeoBundle 'mattn/benchvimrc-vim'
  " NeoBundle 'minibufexpl.vim'
  " NeoBundle 'rhysd/clever-f.vim.git'
  " NeoBundle 'spolu/dwm.vim.git'  " Window Manager
  " NeoBundle 'vimtaku/vim-mlh.git'        " ローマ字で文字を入力したあと /<Space> で文字を変換することができる
  " NeoBundle 'xmledit'
  " NeoBundle 'yoppi/fluentd.vim.git'
  " NeoBundle 'thinca/vim-quickrun'
" Syntax------------------------------------------
    " NeoBundle 'JavaScript-syntax'
    " NeoBundle 'jQuery'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'tpope/vim-markdown'
    NeoBundle 'hail2u/vim-css3-syntax'
  " NeoBundle 'Markdown-syntax'
  " NeoBundle 'kchmck/vim-coffee-script'
  " NeoBundle 'nginx.vim'
" Unite -----------------------------------------
    NeoBundle 'Shougo/unite-outline'
    " NeoBundle 'Shougo/unite-ssh.git'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'kmnk/vim-unite-giti'
    " NeoBundle 'thinca/vim-unite-history'
    NeoBundle 'tsukkee/unite-help'
  " NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
  " NeoBundle 'tsukkee/unite-tag'
" reference--------------------------------------
  " NeoBundle 'thinca/vim-ref'
  " NeoBundle 'taichouchou2/vim-ref-ri'
  " NeoBundle 'taq/vim-rspec'
" Chef -----------------------------------------
  " NeoBundle 'MarcWeber/vim-addon-mw-utils'
  " NeoBundle 'tomtom/tlib_vim'
  " NeoBundle 'garbas/vim-snipmate'
  " NeoBundle 'vadv/vim-chef'
" Rails & Ruby ---------------------------------
  " NeoBundle 'dbext.vim'    " rails.vimと合わせてインストールしておくと，database.ymlの設定を自動で読み込んでvimから直接SQLが打てる
  " NeoBundle 'ujihisa/unite-rake'
  " NeoBundle 'basyura/unite-rails'
  " NeoBundle 'ruby.vim'
  " NeoBundle 'taichouchou2/vim-rails'
  " NeoBundle 'romanvbabenko/rails.vim'
  " NeoBundle 'tpope/vim-endwise.git'
  " NeoBundle 'ruby-matchit'
  " NeoBundle 'rhysd/unite-ruby-require.vim.git'
" PHP ------------------------------------------
    NeoBundle 'taku-o/vim-ethna-switch'
    NeoBundle 'watanabe0621/aoi-jump.vim'
    NeoBundle 'watanabe0621/SmartyJump'
    NeoBundle 'jktgr/smarty.vim'
    NeoBundle 'jktgr/phpfolding.vim'
    NeoBundle 'bpearson/vim-phpcs'
    " NeoBundle 'jktgr/vim-json'
    " NeoBundle 'jktgr/phpcomplete.vim'
 
" 他のvimpluginから必要にされるもの-----------
  " NeoBundle 'mattn/webapi-vim.git'
  " NeoBundle 'cecutil'
    NeoBundle 'L9'
  " NeoBundle 'tyru/open-browser.vim'

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck


"}}}
"-------------------------------------------------------------------------------
" [Basic]
"-------------------------------------------------------------------------------
" エンコーディング設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

  syntax   on                                                          " Syntax有効
  set ambiwidth=double                                                 " Ambiguous width文字表記不具合の是正（iTerm2でDouble-WidthCharactersのチェックONにしないと意味なし)
  set autoindent
  set autoread                                                         " 他で書き換えられたら自動で読み直す
  set backspace=indent,eol,start                                       " バックスペースでなんでも消せるように
  set browsedir=buffer                                                 " ファイル保存の初期ディレクトリをバッファファイル位置に設定
  set clipboard+=unnamed                                               " OSのクリップボードを使用する
  set clipboard=unnamed                                                " ヤンクした文字は、システムのクリップボードに入れる
  set expandtab                                                        " タブを入力した際に自動でホワイトスペースに展開
  set ffs=unix,dos,mac                                                 " 改行コードをUnix系に変更：ffs(fileformats)にunix,dos,macを指定する
  set foldmethod=marker                                                " マーカー文字列による折り畳み(folding)機能有効化
  set formatoptions=lmoq                                               " テキスト整形オプション，マルチバイト系を追加
  set hidden                                                           " 編集中でも他のファイルを開けるようにする
  set hlsearch                                                         " 文字列を検索したときに、マッチしたところをハイライト
  set ignorecase                                                       " 小文字の検索でも大文字も見つかるようにする
  set incsearch                                                        " インクリメンタルサーチを行う
  set lazyredraw                                                       " コマンド実行中は再描画しない
  set list                                                             " 不可視文字表示
  set listchars=tab:▸\ ,trail:_,extends:>,precedes:<,nbsp:%            " 不可視文字の表示形式
  set nobackup                                                         " バックアップ取らない
  set noswapfile                                                       " スワップファイル作らない
  set nowrap                                                           " 折り返ししない
  set nowrapscan                                                       " (no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
  set scrolloff=5                                                      " スクロール時の余白確保
  set shiftwidth=2                                                     " >> 等のコマンドや自動インデントの際に使う1レベル分のインデント量
  set showcmd                                                          " コマンドをステータス行に表示
  set smartcase                                                        " 大文字も含めた検索の場合はその通りに検索する
  set softtabstop=4                                                    " タブを入力した際にタブ文字の代わりに挿入されるホワイトスペースの量
  set tabstop=4
  set ttyfast                                                          " 高速ターミナル接続を行う
  set vb t_vb=                                                         " ビープをならさない
  set whichwrap=b,s,h,l,<,>,[,]                                        " カーソルを行頭、行末で止まらないようにする
" let mapleader = ","                                                  " キーマップリーダー
" set imdisable                                                        " insertモードを抜けるとIMEオフ
" set iminsert=0 imsearch=0                                            " insertモードを抜けるとIMEオフ
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" set noimcmdline                                                      " insertモードを抜けるとIMEオフ
" set nolinebreak                                                      " 勝手に改行するのをやめる
  set nrformats=alpha,octal,hex                                        " <C-a> <C-x> で英字も増減させる
" set textwidth=0                                                      " 一行に長い文章を書いていても自動折り返しをしない
" set undofile                                                         " アンドゥの履歴をファイルに保存し、Vim を一度終了したとしてもアンドゥやリドゥを行えるようにする
" setlocal tabstop=2                                                   " タブ文字の幅を設定できます。デフォルトは8

"-------------------------------------------------------------------------------
" [Apperance]
"-------------------------------------------------------------------------------

  " ターミナルタイプによるカラー設定
  if &term =~ "xterm-256color" || "screen-256color"
    " 256色
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif

  colorscheme molokai
  " カーソル行をハイライト
" set cursorline
" autocmd WinEnter,BufRead * set cursorline
" highlight CursorLine ctermbg=black guibg=black

  " 行頭のTAB文字を可視化
  highlight TabString ctermbg=red guibg=red
  au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
  au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

  " 全角スペースの表示
  highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
  au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
  au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

  " 行末のスペースハイライト
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$/
  autocmd WinEnter * match WhitespaceEOL /\s\+$/


"-------------------------------------------------------------------------------
" [Autocmd]
"-------------------------------------------------------------------------------

  autocmd BufRead *.txt set filetype=markdown                                                          " .txtファイルを、Markdown Syntax Hilightで開く
  autocmd BufRead *.md  set filetype=markdown                                                          " .txtファイルを、Markdown Syntax Hilightで開く
  autocmd BufRead *.sql set filetype=mysql                                                             " .sqlは、すなわちmysql
" autocmd FileType * setlocal formatoptions-=r                                                         " # の行で改行したときなどに #  をつけないように
" autocmd FileType * setlocal formatoptions-=o                                                         " # の行で改行したときなどに #  をつけないように
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")                                                 " ファイルを開くたびに、そのファイルのディレクトリに移動する
" au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif     " 前回終了したカーソル行に移動
  autocmd BufRead *.txt set tw=0                                                                       " *.txtや*.md なファイルを編集するときに長い行で勝手に改行が入ってしまうのを無効に

" autocmd FileType markdown set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-                         " markdownで、list行で改行した時に、次に行で自動的にlist文字が入る
" autocmd FileType markdown set formatoptions=tcroqln                                                  " markdownで、list行で改行した時に、次に行で自動的にlist文字が入る
  autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

  autocmd FileType ruby,eruby set filetype=ruby.eruby.chef                                             " Enable syntax for chef files some like this:

  autocmd FileType php,ctp | set shiftwidth=4
" autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict | set shiftwidth=4
"-------------------------------------------------------------------------------
" [Command]
"-------------------------------------------------------------------------------

  command! Ev        edit   $MYVIMRC                                   " Ev/Rvでvimrcの編集と反映
  command! Rv        source $MYVIMRC                                   " Ev/Rvでvimrcの編集と反映
" command! Nginx     set ft=nginx                                      " ft(FileType)Nginx

"-------------------------------------------------------------------------------
" [Keybind]
"-------------------------------------------------------------------------------

" [Vimfiler]
  " CurrentBufferFile List
  nnoremap <silent> <Space>b  : <C-u>VimFilerBufferDir -split -no-quit -simple -winwidth=30<CR>
  " CurrentDirFileList
  nnoremap <silent> <Space>f  : <C-u>VimFiler          -split -no-quit -simple -winwidth=30<CR>
  " VimfilerExplorer
  nnoremap <silent> <Space>e  : <C-u>VimFilerExplorer  -split -no-quit -simple -winwidth=30 <CR>

" [Unite]
  nnoremap <silent> <Space>/         : <C-u>Unite line                   -direction=rightbelow -buffer-name=search -start-insert -no-quit <CR>
  nnoremap <silent> <Space>u  : <C-u>Unite file_mru file bookmark -direction=rightbelow<CR>
  nnoremap <silent> <Space>o  : <C-u>Unite outline                -direction=rightbelow -no-quit <CR>
  nnoremap <silent> <Space>l  : <C-u>Unite buffer_tab             -direction=rightbelow<CR>


  " nnoremap <silent> <Space>uo       : <C-u>Unite -no-quit -vertical -winwidth=15 outline<CR>
  " nnoremap <silent> <Space>rm         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/model<CR>
  " nnoremap <silent> <Space>rc         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/controller<CR>
  " nnoremap <silent> <Space>rv         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/view<CR>

  " nnoremap <silent> <C-f>          : <C-u>Unite buffer file_mru bookmark file<CR>
  " inoremap <silent> <C-f> <ESC>    : <C-u>Unite buffer file_mru bookmark file<CR>
  " nnoremap <silent> <C-b>          : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>
  " inoremap <silent> <C-b> <ESC>    : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>
  " nnoremap <silent> <C-r>m         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/model<CR>
  " inoremap <silent> <C-r>m <ESC>   : <C-u>Unite -no-quit -vertical -winwidth=50 rails/model<CR>
  " nnoremap <silent> <C-r>c         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/controller<CR>
  " inoremap <silent> <C-r>c <ESC>   : <C-u>Unite -no-quit -vertical -winwidth=50 rails/controller<CR>
  " nnoremap <silent> <C-r>v         : <C-u>Unite -no-quit -vertical -winwidth=50 rails/view<CR>
  " inoremap <silent> <C-r>v <ESC>   : <C-u>Unite -no-quit -vertical -winwidth=50 rails/view<CR>
  "
" [Voom]

  nnoremap <silent> <Space>v       : <C-u>Voom markdown<CR>

" [Other]

  " vimからQuickLookで開く
  " map <Leader>v :write<cr>:sil !/usr/bin/qlmanage -p % > /dev/null &<cr>:redraw!<cr>
  " 1,0,9で行頭、行末へ
  " 行末、行の最初への移動のキーマップ設定
  :map! <C-e> <Esc>$
  :map <C-e> <Esc>$
  " 9で行末へ
  noremap 1 ^
  noremap 9 $
  " 「Ctrl+C」の2回押しでハイライト消去
  nmap <C-c><C-c> ;nohlsearch<CR><ESC>
  " us key
  noremap  ; :
  " 挿入モードにならずに改行できる
  noremap <CR> o<ESC>
  " タブ移動を直感的に
  noremap gh gT
  " タブ移動を直感的に
  noremap gl gt
  " insertモードを抜けるとIMEオフ
  ""inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  " Ctrl + c とEscの動作を完全に一致させる
  inoremap <C-c> <ESC>

  " 現在のバッファを閉じます
  noremap  <silent><Space>k    :bd<CR>
  " ファイル保存(バッファ変更時のみ)
  nnoremap <silent><Space>s    :<C-u>update<CR>

  nmap <C-l> >>
  nmap <C-h> <<

  " map <C-a> <Esc>^
  " map! <C-b> <Esc>h
  " map! <C-f> <Esc>l
  " map <C-b> <Esc>h
  " map <C-f> <Esc>l

   " C-j, C-kで1行スクロール
  noremap <C-j> <C-e>
  noremap <C-k> <C-y>
    " インサートモードでもhjklで移動（Ctrl押すけどね）
  " imap <C-j> <Down>
  " imap <C-k> <Up>
  " imap <C-h> <Left>
  " imap <C-l> <Right>

    " 最後に編集された位置に移動
  " nnoremap gb '[
  " nnoremap gp ']

    " 対応する括弧に移動
  " nnoremap ( %
  " nnoremap ) %

    " 最後に変更されたテキストを選択する
" nnoremap gc  " nnoremap gc  `[v`]
" nnoremap gc  " vnoremap gc <C-u>normal gc<Enter>
" nnoremap gc  " onoremap gc <C-u>normal gc<Enter>

  " paste yanked string vertically。<C-v> 時に<C-p> でvertical に paste
    vnoremap <C-p> I<C-r>"<ESC><ESC>

  " visualモードで置き換えたい文字を選択した後、「p」で0のレジスターを使用する(visualモードで選択したあとに、ヤンクした文字をペーストするとその置き換えた文字がヤンクされてしまい2回目同じようにしようとすると、前回置き換えた文字がペーストされてしまうので）
    vnoremap <silent> p "0p<CR>

  " qでウインドウを閉じて Qでマクロ
    nnoremap q :<C-u>q<CR>
    nnoremap Q q

"-------------------------------------------------------------------------------
" [Source]
"-------------------------------------------------------------------------------

  " Vundle Plugin に関する設定を読み込む
  source ~/.vimrc.plugins_setting

"-------------------------------------------------------------------------------
" [Function]
"-------------------------------------------------------------------------------

" augroup BUFWRITE_POSTDELETE                                " 内容が空のファイルを保存したら自動で削除する(*.mkdのみ)
"   au!
"   autocmd BufWritePost *.md call BufWritePostDelete()
" augroup END
" function! BufWritePostDelete()
"   let crlen = 0
"   if &binary == 0
"     let crlen = &ff=='dos' ? 2 : 1
"   endif
"   if getfsize(expand('%:p')) <= crlen
"     call delete(expand('%:p'))
"   endif
" endfunction
" 

"------------------------------------------------
" CSVのハイライト表示
" @see http://www.vim.org/tips/tip.php?tip_id=667
"------------------------------------------------
" csv の特定のカラムをハイライト (put in .vimrc)
" 使い方↓↓
" :Csv 5                            : 5番めのカラムをハイライト
" function! CSVH(x)
"   execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
"   execute 'normal ^'.a:x.'f,'
" endfunction
" command! -nargs=1 Csv :call CSVH(<args>)
" 
" 

"let g:ref_use_vimproc=1
"let g:ref_refe_version=2
"nmap ,rr :<C-u>Ref refe<Space>
"



  " カッコやクオートなどを入力した際に左に自動で移動します
  inoremap {} {}<Left>
  inoremap [] []<Left>
  inoremap () ()<Left>
  inoremap "" ""<Left>
  inoremap '' ''<Left>
  inoremap <> <>


" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" Shift + 矢印でウィンドウサイズを変更
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>






" PHPCSのスタイルを設定
let Vimphpcs_Standard='PSR2'

" PHPの名前空間を保管する設定
"inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
"noremap <Leader>e :call PhpExpandClass()<CR>



" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2



inoremap <C-d> $
inoremap <C-a> @
inoremap <C-j> _
inoremap <C-k> ()

" phpfolding
augroup vimrc
  autocmd FileType phpunit EnableFastPHPFolds
augroup END



