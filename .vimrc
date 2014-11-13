
set nocompatible
" filetype off
scriptencoding utf-8
set encoding=utf-8
let s:isunix = has('unix')
let s:ismac =  (has('mac') || has('macunix') || has('guimacvim') || system('uname') =~? '^darwin')


" neobundle {{{
" --------------------------------------------------------------------------------------------------------
" Bundles 
let $VIM = expand('~/.vim')
let $BUNDLE = $VIM.'/bundle'
let s:neobundle_dir = $BUNDLE.'/neobundle.vim'
if !isdirectory(s:neobundle_dir)

  if executable('git')
    echo 'Initializing neobundle'
    execute '!mkdir -p '.$BUNDLE
          \.' && git clone https://github.com/Shougo/neobundle.vim '.$BUNDLE.'/neobundle.vim'
          \.' && git clone https://github.com/Shougo/unite.vim '.$BUNDLE.'/unite.vim'
          \.' && git clone https://github.com/Shougo/vimproc '.$BUNDLE.'/vimproc'
    if s:ismac
      execute '!cd '.$BUNDLE.'/vimproc && make -f make_mac.mak'
    else
      if executable('gcc')
        execute '!cd '.$BUNDLE.'/vimproc && make -f make_unix.mak'
      else
        echo 'gcc not found!'
      endif
    endif
  else
    echo 'git not found! Sorry, this .vimrc cannot be completely used without git.'
  endif
else
  if has('vim_starting')
    execute 'set runtimepath+='.expand(s:neobundle_dir)
  endif
  call neobundle#begin(expand($BUNDLE))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
  " }}}
  " neoconplete & neosnippet {{{
  " --------------------------------------------------------------------------------------------------------
  if has('lua') && v:version > 703
    NeoBundle 'Shougo/neocomplete.vim'
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    " let g:neocomplete#enable_cursor_hold_i = 1
    " let g:neocomplete#max_list = 1000
    " let g:neocomplete#skip_auto_completion_time = "0.50"
    " let g:neocomplete#enable_auto_close_preview = 1
    " let g:neocomplete#auto_completion_start_length = 1
    " let g:neocomplete#max_keyword_width = 50
    " if !exists('g:neocomplete#force_omni_input_patterns')
    "   let g:neocomplete#force_omni_input_patterns = {}
    " endif
    " let g:neocomplete#force_overwrite_completefunc = 1
    " let g:neocomplete#force_omni_input_patterns.c =
    "       \ '[^.[:digit:] *\t]\%(\.\|->\)'
    " let g:neocomplete#force_omni_input_patterns.cpp =
    "       \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " let g:neocomplete#force_omni_input_patterns.objc =
    "       \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " let g:neocomplete#force_omni_input_patterns.objcpp =
    "       \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " function! s:cancel_popup(key)
    "   return a:key . neocomplete#cancel_popup()
    " endfunction
    " function! s:cancel_popup_reverse(key)
    "   return neocomplete#cancel_popup() . a:key
    " endfunction
    " function! s:goback_insert(key)
    "   return "gi" . a:key . neocomplete#cancel_popup()
    " endfunction
  endif
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  let g:neosnippet#snippets_directory = expand($VIM.'/snippets')
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  " NeoBundle 'ujihisa/neco-look'
  " --| Requirement: look commnad
  " }}}
  " Unite ( "<space>" ) {{{
  " --------------------------------------------------------------------------------------------------------
  "let mapleader = ","
  NeoBundle 'Shougo/neomru.vim'
  let mapleader = "<space>"
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/unite-outline'
    let g:unite_enable_start_insert = 1
    let g:unite_cursor_line_highlight = 'CursorLine'
    "インサートモードで開始しない
    let g:unite_enable_start_insert = 1
    let g:unite_source_file_mru_limit = 1000
    let g:vimfiler_enable_auto_cd = 1
    let g:unite_force_overwrite_statusline = 0
    if executable('ag')
      let g:unite_source_grep_command = 'ag'
      let g:unite_source_grep_default_opts =
            \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'''
      let g:unite_source_grep_recursive_opt = ''
    else
      let g:unite_source_grep_command = 'grep'
      let g:unite_source_grep_default_opts = '-iHn'
    endif
    if s:ismac && has('multi_byte')
      let g:unite_marked_icon = '✓'
    else
      let g:unite_marked_icon = 'v'
    endif
    let g:unite_candidate_icon = '-'
    " nnoremap <C-u> :Unite<SPACE>
    " nnoremap <silent><S-k> :Unite output:message         -buffer-name=output<CR>
    " nnoremap <silent><C-z> :Unite file_mru               -buffer-name=file_mru<CR>
    nnoremap <silent><space>/     :Unite line                   -buffer-name=line       -direction=rightbelow      -no-quit <CR>
    nnoremap <silent><space>r     :Unite file_mru      bookmark -buffer-name=file_mru   -direction=rightbelow<CR>
    nnoremap <silent><space>f     :Unite file                   -buffer-name=files      -direction=rightbelow<CR>
    nnoremap <silent><space>g     :Unite file_rec/async:!       -buffer-name=files      -direction=rightbelow<CR>
    nnoremap <silent><space>o     :Unite outline                -buffer-name=outline    -vertical    -winwidth=30  -no-quit <CR>
    " nnoremap <silent><C-p> :Unite buffer                 -buffer-name=buffer     -direction=rightbelow<CR>
    nnoremap <silent><space>l     :Unite buffer_tab             -buffer-name=buffer_tab -direction=rightbelow<CR>

    augroup Unite
      autocmd!
      autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
      autocmd FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
      autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
      autocmd FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
      " autocmd FileType unite inoremap <silent> <buffer> <C-z> <Nop>
      " autocmd FileType unite inoremap <silent> <buffer> <C-o> <Nop>
      " autocmd FileType unite nmap <buffer> <C-a> <Plug>(unite_insert_enter)
      " autocmd FileType unite nmap <buffer> OA <Plug>(unite_rotate_previous_source)
      " autocmd FileType unite nnoremap <buffer> OB <Down>
      " autocmd FileType unite nmap <buffer> <Bs> <Plug>(unite_exit)
    augroup END
    " NeoBundleLazy 'unite-colorscheme', {'autoload': {'unite_sources': ['colorscheme']}}
    " NeoBundleLazy 'osyo-manga/unite-highlight', {'autoload': {'unite_sources': ['highlight']}}
    NeoBundle 'ujihisa/vim-ref'
  " }}}
  " QuickRun / Filer / Outer world of Vim ( "\\" ) {{{
  " --------------------------------------------------------------------------------------------------------
  " let mapleader = "\\"
  NeoBundle 'Shougo/vimproc'
  "   , {
  "   \ 'build' : {
  "   \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
  "   \     'cygwin' : 'make -f make_cygwin.mak',
  "   \     'mac' : 'make -f make_mac.mak',
  "   \     'unix' : 'make -f make_unix.mak',
  "   \   },
  "   \ }
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'tyru/open-browser.vim'
    let g:quickrun_config = {'_': {'runner': 'vimproc', 'runner/vimproc/updatetime': 60, 'split': 'vertical', "outputter/buffer/split" : ":botright" ,"outputter/buffer/close_on_empty" : 1}}
    let g:quickrun_config['markdown'] = {'outputter': 'browser'}

    NeoBundle 'Shougo/vimfiler'
    let g:vimfiler_as_default_explorer = 1
    " let g:vimfiler_sort_type = 'TIME'
    let g:vimfiler_safe_mode_by_default = 0
    let g:unite_enable_start_insert = 1
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
    let g:vimfiler_file_icon = '-'
    if s:ismac && has('multi_byte')
      let g:vimfiler_readonly_file_icon = '✗'
      let g:vimfiler_marked_file_icon = '✓'
    else
      let g:vimfiler_readonly_file_icon = 'x'
      let g:vimfiler_marked_file_icon = 'v'
    endif
    " nnoremap <silent> <Leader>f :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    " nnoremap <silent> <Leader><Leader> :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    " nnoremap <silent> @<Leader> :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    " nnoremap <silent>@@ :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>

    " CurrentBufferFile List
    nnoremap <silent> <Space>b  : <C-u>VimFilerBufferDir -split -no-quit -simple -winwidth=30<CR>
    " CurrentDirFileList
    nnoremap <silent> <Space>c  : <C-u>VimFiler                          -simple -winwidth=30  -auto-cd<cR>
    " VimfilerExplorer
    nnoremap <silent> <Space>e  : <C-u>VimFilerExplorer  -split -no-quit -simple -winwidth=30 <CR>
  NeoBundle 'mattn/webapi-vim'
  " }}}
  " ALL {{{
  NeoBundle 'Shougo/vimshell.git'
  " ---------------------------------------------

  " Markdown {{{
  NeoBundle 'git://github.com/itspriddle/vim-marked.git'
  NeoBundle 'VOoM'
  nnoremap <silent> <Space>v       : <C-u>Voom markdown<CR>
  " }}}

  NeoBundle 'Changed'
  NeoBundle 'Gundo'                                   " undo履歴を追える
  " NeoBundle 'SQLUtilities'
  " NeoBundle 'bash-support.vim'
  " NeoBundle 'git://github.com/jimsei/winresizer.git'
  NeoBundle 'git://github.com/tpope/vim-surround.git' " テキストを括弧で囲む／削除する
  " NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'h1mesuke/vim-alignta'
  NeoBundle 'repeat.vim'                              " surround.vimで繰り返しを使うために必要
  NeoBundle 'kwbdi.vim'                               " keep Window on Buffer Delete
  " NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'tomasr/molokai'
  let g:molokai_original = 1
  let g:rehash256 = 1
  colorscheme molokai
  " NeoBundle 'mattn/livestyle-vim'
  " NeoBundle 'tell-k/vim-browsereload-mac'
  NeoBundle 'tomtom/tcomment_vim'                     " コメント処理 \c<Space>
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tyru/vim-altercmd'
  " NeoBundle 'yuratomo/w3m.vim.git'
  " NeoBundle 'thinca/vim-localrc'
  NeoBundle 'majutsushi/tagbar'
  " NeoBundle 'vim-scripts/tagbar-phpctags'
  " NeoBundle 'tsukkee/lingr-vim'
  " NeoBundle 'PDV--phpDocumentor-for-Vim'
  " NeoBundle 'phpfolding.vim'
  " NeoBundle 'jtratner/vim-flavored-markdown'
  " NeoBundle 'Auto-Pairs'
  " NeoBundle 'Quich-Filter'
  " NeoBundle 'css_color.vim'
  " NeoBundle 'eregex.vim'
  " NeoBundle 'git://github.com/thinca/vim-showtime.git'
  NeoBundle 'kana/vim-fakeclip'                " tmuxでyankやpasteの時にOS clipboardを使う
  " NeoBundle 'minibufexpl.vim'
  " NeoBundle 'rhysd/clever-f.vim.git'
  " NeoBundle 'spolu/dwm.vim.git'  " Window Manager
  " NeoBundle 'vimtaku/vim-mlh.git'        " ローマ字で文字を入力したあと /<Space> で文字を変換することができる
  " NeoBundle 'xmledit'
  " Syntax------------------------------------------
  " NeoBundle 'JavaScript-syntax'
  " NeoBundle 'jQuery'
  " NeoBundle 'kchmck/vim-coffee-script'
  " NeoBundle 'nginx.vim'
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
    NeoBundle 'ruby.vim'
  " NeoBundle 'taichouchou2/vim-rails'
  " NeoBundle 'romanvbabenko/rails.vim'
  " NeoBundle 'tpope/vim-endwise.git'
  " NeoBundle 'ruby-matchit'
  " NeoBundle 'rhysd/unite-ruby-require.vim.git'
  " NeoBundle 'tyru/operator-camelize.vim'            " 選択したテキストオブジェクトをsnake_caseやcamelCaseに変換するオペレーター
  NeoBundle 'jktgr/vim-json'
  " NeoBundle 'jktgr/phpcomplete.vim'

  " 他のvimpluginから必要にされるもの-----------
  NeoBundle 'mattn/gist-vim'
  " NeoBundle 'cecutil'
  NeoBundle 'L9'
  " }}}
  " PHP & HTML & Smarty {{{
if has('multi_byte')
  NeoBundle 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'passive' }
  " let g:syntastic_echo_current_error = 0
  " エラー行をsignで表示する
  let g:syntastic_enable_signs = 1
  let g:syntastic_enable_highlighting = 1
  augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.php,*.html call s:syntastic()
  augroup END
  function! s:syntastic()
    if exists(':SyntasticCheck') | exec 'SyntasticCheck' | endif
  endfunction
endif
  NeoBundle 'html5.vim'                  "     , {'autoload': {'filetypes': ['html']}}
  " NeoBundle 'taku-o/vim-ethna-switch'    "     , {'autoload': {'filetypes': ['php']}}
  " NeoBundle 'watanabe0621/aoi-jump.vim'  "     , {'autoload': {'filetypes': ['php']}}
  " NeoBundle 'watanabe0621/SmartyJump'    "     , {'autoload': {'filetypes': ['tpl']}}
  " NeoBundle 'pasela/unite-fuel'          "     , {'autoload': {'filetypes': ['php']}}
  " NeoBundle 'bpearson/vim-phpcs'
  " let Vimphpcs_Standard='PSR2'               " PHPCSのスタイルを設定
  " NeoBundle 'joonty/vdebug.git'          "     , {'autoload': {'filetypes': ['php']}}
  " NeoBundle 'smarty.vim'           "     , {'autoload': {'filetypes': ['tpl']}}

  autocmd BufRead *.tpl set filetype=smarty
  autocmd FileType html,smarty : set shiftwidth=2
  " autocmd FileType php,json :set dictionary=~/.vim/dict/php.dict | set shiftwidth=4

  " Xdebug
  " let g:vdebug_options = {
  " \    "break_on_open" : 0,
  " \    "continuous_mode"  : 1,
  " \}

  " PHPの名前空間を保管する設定
  "inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
  "noremap <Leader>e :call PhpExpandClass()<CR>
  " }}}
  " EMMET {{{
  NeoBundle 'mattn/emmet-vim'
  let g:user_emmet_expandabbr_key = '<tab>'
  let g:use_emmet_complete_tag = 1
  let g:user_emmet_settings = {
        \  'lang' : 'ja',
        \  'html' : {
        \    'filters' : 'html',
        \    'indentation' : ' '
        \  },
        \  'php' : {
        \    'extends' : 'html',
        \    'filters' : 'html,c',
        \  },
        \  'css' : {
        \    'filters' : 'fc',
        \  },
        \  'javascript' : {
        \    'snippets' : {
        \      'jq' : "$(function() {\n\t${cursor}${child}\n});",
        \      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
        \      'fn' : "(function() {\n\t${cursor}\n})();",
        \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
        \    },
        \  },
        \}
  " }}}
  " Other {{{
  " NeoBundle 'itspriddle/vim-javascript-indent'
  " NeoBundle 'JSON.vim'
  " NeoBundle 'mhinz/vim-startify'
  " NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': ['less']}}
  " NeoBundleLazy 'less.vim', {'autoload': {'filetypes': ['less']}}
  " NeoBundleLazy 'vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
  NeoBundle 'osyo-manga/vim-over'
  NeoBundle 'https://github.com/rbtnn/rabbit-ui.vim'
  "NeoBundle 'itchyny/calendar.vim'
  NeoBundle 'SQLComplete.vim'
  NeoBundle 'dzeban/vim-log-syntax'
  NeoBundle 'moznion/hateblo.vim'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'rcmdnk/vim-markdown'
  NeoBundle 'kylef/apiblueprint.vim'


  " }}}



  filetype plugin indent on     " Required!
endif
" }}} Bundles

"-------------------------------------------------------------------------------
" [Basic]
"-------------------------------------------------------------------------------
" エンコーディング設定

  syntax   on                                                          " Syntax有効
  set ambiwidth=double                                                 " Ambiguous width文字表記不具合の是正（iTerm2でDouble-WidthCharactersのチェックONにしないと意味なし)
  set autoindent
  set autoread                                                         " 他で書き換えられたら自動で読み直す
  set backspace=indent,eol,start                                       " バックスペースでなんでも消せるように
  set browsedir=buffer                                                 " ファイル保存の初期ディレクトリをバッファファイル位置に設定
  " set clipboard+=unnamed                                               " OSのクリップボードを使用する
  set clipboard=unnamed,unnamedplus
  " set clipboard+=autoselect                                            " 選択した瞬間、clipboardに入れる
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
  set nowrapscan                                                       " 検索時にファイルの最後まで行ったら最初に戻らないようにする
  set scrolloff=5                                                      " スクロール時の余白確保
  set shiftwidth=2                                                     " >> 等のコマンドや自動インデントの際に使う1レベル分のインデント量
  set showcmd                                                          " コマンドをステータス行に表示
  set smartcase                                                        " 大文字も含めた検索の場合はその通りに検索する
  set wildmenu                                                         " 補完候補がコマンドラインのすぐ上の行に表示されるようになる
  set softtabstop=4                                                    " タブを入力した際にタブ文字の代わりに挿入されるホワイトスペースの量
  set tabstop=4
  "set updatetime=300
  "set ttyfast                                                          " 高速ターミナル接続を行う
  set vb t_vb=                                                         " ビープをならさない
  set whichwrap=b,s,h,l,<,>,[,]                                        " カーソルを行頭、行末で止まらないようにする
  set mouse=a                                                          " マウスモード有効
  set ttymouse=xterm2                                                  " xtermとscreen対応
" let mapleader = ","                                                  " キーマップリーダー
" set imdisable                                                        " insertモードを抜けるとIMEオフ
" set noimcmdline                                                      " insertモードを抜けるとIMEオフ
" set nolinebreak                                                      " 勝手に改行するのをやめる
" set nrformats=aplha                                   " <C-a> <C-x> で英字も増減させる、かつ9進数の計算をさせない
" set nrformats=octal
  set nrformats=alpha
  set textwidth=0                                                      " 一行に長い文章を書いていても自動折り返しをしない
" undo 履歴の保存
if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile " ホームディレクトリ以下のファイルを修正時のみ、履歴の保存機能を有効化する
  augroup END
endif
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

  autocmd BufRead *.sql set filetype=mysql                                                             " .sqlは、すなわちmysql
" autocmd FileType * setlocal formatoptions-=r                                                         " # の行で改行したときなどに #  をつけないように
" autocmd FileType * setlocal formatoptions-=o                                                         " # の行で改行したときなどに #  をつけないように
  " autocmd BufEnter * execute ":lcd " . expand("%:p:h")                                                 " ファイルを開くたびに、そのファイルのディレクトリに移動する
  " au      BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif     " 前回終了したカーソル行に移動
" autocmd FileType markdown set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-                         " markdownで、list行で改行した時に、次に行で自動的にlist文字が入る
" autocmd FileType markdown set formatoptions=tcroqln                                                  " markdownで、list行で改行した時に、次に行で自動的にlist文字が入る

" autocmd FileType ruby,eruby set filetype=ruby.eruby.chef                                             " Enable syntax for chef files some like this:

"-------------------------------------------------------------------------------
" [Command]
"-------------------------------------------------------------------------------

  command! Ev        edit   $MYVIMRC                                   " Ev/Rvでvimrcの編集と反映
  command! Rv        source $MYVIMRC                                   " Ev/Rvでvimrcの編集と反映
" command! Nginx     set ft=nginx                                      " ft(FileType)Nginx

"-------------------------------------------------------------------------------
" [Keybind]
"-------------------------------------------------------------------------------

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
  " auto migration Normal Mode
  inoremap  ; ;<ESC>
  " 挿入モードにならずに改行できる
  noremap <CR> o<ESC>
  " タブ移動を直感的に
  noremap gh gT
  noremap gl gt
  " Ctrl + c とEscの動作を完全に一致させる
  inoremap <C-c> <ESC>

  " 現在のバッファを閉じます
  noremap  <silent><Space>k    :bd<CR>
  " ファイル保存(バッファ変更時のみ)
  nnoremap <silent><Space>s    :<C-u>update<CR>

  nmap <C-l> >>
  nmap <C-h> <<

  " map <C-a> <Esc>^
  map! <C-b> <Esc>h
  map! <C-f> <Esc>l
  map <C-b> <Left>
  map <C-f> <Right>


"-------- コマンドラインでのキーバインド
" マーク位置へのジャンプを行だけでなく桁位置も復元できるようにする
" map ' `
" Ctrl+Nで次のバッファを表示
" map <C-N>   :bnext<CR>
" Ctrl+Pで前のバッファを表示
" map <C-P>   :bprevious<CR>
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
" imap <C-K>  <ESC>"*pa
" Ctrl+Shift+Jで上に表示しているウィンドウをスクロールさせる
" nnoremap <C-S-J> <C-W>k<C-E><C-W><C-W>
"Emacs スタイルにする
" Ctrl+Aで行頭へ移動
:cnoremap <C-A>		<Home>
" Ctrl+Bで一文字戻る
:cnoremap <C-B>		<Left>
" Ctrl+Dでカーソルの下の文字を削除
:cnoremap <C-D>		<Del>
" Ctrl+Eで行末へ移動
:cnoremap <C-E>		<End>
" Ctrl+Fで一文字進む
:cnoremap <C-F>		<Right>
" Ctrl+Nでコマンドライン履歴を一つ進む
:cnoremap <C-N>		<Down>
" Ctrl+Pでコマンドライン履歴を一つ戻る
:cnoremap <C-P>		<Up>
" Alt+Ctrl+Bで前の単語へ移動
" :cnoremap <Esc><C-B>	<S-Left>
" Alt+Ctrl+Fで次の単語へ移動
" :cnoremap <Esc><C-F>	<S-Right> 

"--------------

   " C-j, C-kで1行スクロール
  noremap <C-o> zo
  noremap <C-z> zc

   " C-j, C-kで1行スクロール
  noremap <C-j> <C-e>
  noremap <C-k> <C-y>

    " 最後に編集された位置に移動
  " nnoremap gb '[
  " nnoremap gp ']

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
  " source ~/.vimrc.plugins_setting

"" カッコやクオートなどを入力した際に左に自動で移動します
  inoremap {} {}<Left>
  inoremap [] []<Left>
  inoremap () ()<Left>
  inoremap "" ""<Left>
  inoremap '' ''<Left>
  inoremap <> <><left>
"  inoremap `` ``<left>

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>


inoremap <C-d> $
inoremap <C-a> @
inoremap <C-j> _
inoremap <C-l> ()





" 0:表示しない 1:２つ以上のタブがあるとき表示 2:常に表示。
set showtabline=2
set laststatus=0
" タブのカラー
hi TabLine      guifg=bg        guibg=#505050   ctermfg=16    ctermbg=239       gui=none      cterm=none
"余った領域のカラー
hi TabLineFill  guifg=#a0a0a0   guibg=#505050   ctermfg=247    ctermbg=236       gui=none      cterm=none
" 現在タブのカラー
hi TabLineSel   guifg=#000000   guibg=#c0e0ff   ctermfg=214     ctermbg=234       gui=none      cterm=none



"-------------------------------------------------------------------------------
" tcomment_vim
"-------------------------------------------------------------------------------

let g:tcommentMapLeader1 = '<C-_>'     "     (default: '<c-_>')
let g:tcommentMapLeader2 = '<Leader>'  "        (default: '<Leader>_')
" let g:tcommentMapLeaderOp1 = 'gc'      "  (default: 'gc')
" let g:tcommentMapLeaderOp2 = 'gC'      "  (default: 'gC')

" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'php_surround' : "<?php %s ?>",
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

" マッピングを追加
"  <C-_>= => <%= %>でトグル
"  <C-_>- => <% -%>でトグル
"  <C-_>c => ファイル形式から、<?php ?>か<% %>でトグル

" function! SetErubyMapping2()
"   nmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
"   nmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
"   nmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
" 
"   vmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
"   vmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
"   vmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
" endfunction
" 
" " erubyのときだけ設定を追加
" au FileType eruby call SetErubyMapping2()


"-------------------------------------------------------------------------------

" let g:winresizer_start_key = '<C-t>'
" let g:winresizer_keycode_cancel = 122
" let g:winresizer_vert_resize = 3

" Gundo

let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
nnoremap g; :GundoToggle<CR>

"-------------------------------------------------------------------------------
" vim-browserreload-mac
"-------------------------------------------------------------------------------
" リロード後に戻ってくるアプリ 変更してください
" let g:returnApp = "iTerm"
" nmap <Space>bc :ChromeReloadStart<CR>
" nmap <Space>bC :ChromeReloadStop<CR>
" nmap <Space>bf :FirefoxReloadStart<CR>
" nmap <Space>bF :FirefoxReloadStop<CR>
" nmap <Space>bs :SafariReloadStart<CR>
" nmap <Space>bS :SafariReloadStop<CR>
" nmap <Space>bo :OperaReloadStart<CR>
" nmap <Space>ba :AllBrowserReloadStart<CR>
" nmap <Space>bA :AllBrowserReloadStop<CR>

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1      " ファイルタイプを自動で認識して、GistにPOST
" let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'w3m %URL%'
" let g:gist_show_privates = 1
" let g:gist_post_private = 1
" let g:gist_get_multiplefile = 1
let g:github_api_url = 'https://git.gree-dev.net/api/v3'


nnoremap <silent><space>p    :TagbarToggle<CR>
set cmdheight=1 "コマンドラインを1行しか表示させない



" -----------------------------------------------------------------------------
"  php-doc
" -----------------------------------------------------------------------------
" autocmd FileType php inoremap <C-@> <ESC>:call PhpDocSingle()<CR>i
" autocmd FileType php nnoremap <C-@> :call PhpDocSingle()<CR>
" autocmd FileType php vnoremap <C-@> :call PhpDocRange()<CR>
" let g:pdv_cfg_Type = "int"
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = ""
" let g:pdv_cfg_Copyright = "GREE, Inc."
" let g:pdv_cfg_Author = ""
" let g:pdv_cfg_License = ""
" 
" " After phpDoc standard
" let g:pdv_cfg_CommentHead = "/**"
" let g:pdv_cfg_Comment1 = " * "
" let g:pdv_cfg_Commentn = " *"
" let g:pdv_cfg_CommentTail = " */"
" let g:pdv_cfg_CommentSingle = "// "
" 
" " Attributes settings
" let g:pdv_cfg_Uses       = 0
" let g:pdv_cfg_php4always = 0
" let g:pdv_cfg_php4guess  = 0


" markdown syntax
autocmd BufNewFile,BufRead *.md,*.markdown,*.txt setlocal filetype=markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" changed.vimによるsign表示がちらちらしてかなわんので、signを常に表示する
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" -----------------------------------------------------------------------------
"  PHP Folding
" -----------------------------------------------------------------------------
" augroup vimrc
"     autocmd FileType phpunit EnableFastPHPFolds
" augroup END



" -----------------------------------------------------------------------------
"  Vim Startyfy
" -----------------------------------------------------------------------------
"   " startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
"   let g:startify_custom_header =
"     \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
"   " デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
"   let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
"   " よく使うファイルをブックマークとして登録しておく
"   let g:startify_bookmarks = [
"     \ '~/.vimrc',
"     \ ]

" calendar.vim
  " let g:calendar_google_calendar = 1
  " let g:calendar_google_task = 1



imap <buffer> <C-C>a <C-\><C-O>:call sqlcomplete#Map('syntax')<CR><C-X><C-O>
let g:sql_type_default = 'mysql'
autocmd FileType sql set omnifunc=sqlcomplete#Complete
autocmd FileType mysql set omnifunc=sqlcomplete#Complete



" :EditCSV
" function! s:edit_csv(path)
"   call writefile(map(rabbit_ui#gridview(map(readfile(a:path),'split(v:val,",",1)')), "join(v:val, ',')"), a:path)
" endfunction
" 
" command! -nargs=1 EditCSV  :call <sid>edit_csv(<q-args>)


" Evervim
NeoBundle 'kakkyz81/evervim'
source ~/.vimrc.evervim

" NeoSnippet
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/.vim.snippet/'
let g:neosnippet#snippets_directory = s:my_snippet


" previm
" 独自のCSSを指定
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '/Users/syotaro/dotfiles/css/previm.css'


set spelllang+=cjk


autocmd BufRead *.tsv set filetype=tsv

nnoremap <silent><space>p :QuickRun<CR>
"nnoremap <silent><space>p    :TagbarToggle<CR>
