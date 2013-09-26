
" INITIALIZE {{{
" --------------------------------------------------------------------------------------------------------
set nocompatible
filetype off
scriptencoding utf-8
set encoding=utf-8
if !executable(&shell) | set shell=sh | endif
let s:isunix = has('unix')
let s:iswin = has('win16') || has('win32') || has('win64')
let s:iscygwin = has('win32unix')
let s:ismac = !s:iswin && !s:iscygwin && (has('mac') || has('macunix') || has('guimacvim') || system('uname') =~? '^darwin')
let s:nosudo = $SUDO_USER == ''
augroup ESC
  autocmd!
augroup END
augroup SetLocal
  autocmd!
augroup END
function! s:safeexecute(s, ...)
  if a:0
    let check = a:1
  else
    let check = a:s
  endif
  if exists(check)
    try
      silent execute a:s
    catch
      try
        silent execute 'call '.a:s
      catch
      endtry
    endtry
  endif
endfunction
function! CompleteNothing(...)
  return []
endfunction
" }}}
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
  call neobundle#rc(expand($BUNDLE))
  NeoBundleFetch 'Shougo/neobundle.vim'
  " nnoremap <silent> <S-b><S-b> :<C-u>NeoBundleUpdate<CR>
  nnoremap <silent> <S-b><S-b> :<C-u>Unite neobundle/update<CR>
  " }}}
  " neoconplete & neosnippet {{{
  " --------------------------------------------------------------------------------------------------------
  if s:nosudo
    if has('lua') && v:version > 703
      NeoBundle 'Shougo/neocomplete.vim'
      let g:neocomplete#enable_at_startup = 1
      let g:neocomplete#enable_smart_case = 1
      " let g:neocomplete#enable_cursor_hold_i = 1
      let g:neocomplete#max_list = 1000
      let g:neocomplete#skip_auto_completion_time = "0.50"
      let g:neocomplete#enable_auto_close_preview = 1
      let g:neocomplete#auto_completion_start_length = 1
      let g:neocomplete#max_keyword_width = 50
      if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
      endif
      let g:neocomplete#force_overwrite_completefunc = 1
      let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)'
      let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
      let g:neocomplete#force_omni_input_patterns.objc =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
      let g:neocomplete#force_omni_input_patterns.objcpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
      function! s:cancel_popup(key)
        return a:key . neocomplete#cancel_popup()
      endfunction
      function! s:cancel_popup_reverse(key)
        return neocomplete#cancel_popup() . a:key
      endfunction
      function! s:goback_insert(key)
        return "gi" . a:key . neocomplete#cancel_popup()
      endfunction
    else
    endif
    NeoBundle 'Shougo/neosnippet'
    let g:neosnippet#snippets_directory = expand($VIM.'/snippets')
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: "\<TAB>"
    NeoBundle 'ujihisa/neco-look'
    " --| Requirement: look commnad
  else
    function! s:cancel_popup(key)
      return a:key . (pumvisible() ? "\<C-e>" : '')
    endfunction
    function! s:cancel_popup_reverse(key)
      return (pumvisible() ? "\<C-e>" : '') . a:key
    endfunction
    function! s:goback_insert(key)
      return "gi" . a:key . (pumvisible() ? "\<C-e>" : '')
    endfunction
  endif
  " }}}
  " Unite ( "<space>" ) {{{
  " --------------------------------------------------------------------------------------------------------
  "let mapleader = ","
  let mapleader = "<space>"
  if s:nosudo
    NeoBundle 'Shougo/unite.vim'
    let g:unite_enable_start_insert = 1
    let g:unite_cursor_line_highlight = 'CursorLine'
    "インサートモードで開始しない
    let g:unite_enable_start_insert = 0
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
    nnoremap <silent><space>u     :Unite file_mru file bookmark -buffer-name=files      -direction=rightbelow<CR>
    nnoremap <silent><space>o     :Unite outline                -buffer-name=outline    -direction=rightbelow     -no-quit <CR>
    " nnoremap <silent><C-p> :Unite buffer                 -buffer-name=buffer     -direction=rightbelow<CR>
    nnoremap <silent><space>l     :Unite buffer_tab             -buffer-name=buffer_tab -direction=rightbelow<CR>

    augroup Unite
      autocmd!
      autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
      autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
      autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
      autocmd FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
      autocmd FileType unite inoremap <silent> <buffer> <C-z> <Nop>
      autocmd FileType unite inoremap <silent> <buffer> <C-o> <Nop>
      autocmd FileType unite nmap <buffer> <C-a> <Plug>(unite_insert_enter)
      autocmd FileType unite nmap <buffer> OA <Plug>(unite_rotate_previous_source)
      autocmd FileType unite nnoremap <buffer> OB <Down>
      autocmd FileType unite nmap <buffer> <Bs> <Plug>(unite_exit)
    augroup END
    NeoBundleLazy 'unite-colorscheme', {'autoload': {'unite_sources': ['colorscheme']}}
    NeoBundleLazy 'osyo-manga/unite-highlight', {'autoload': {'unite_sources': ['highlight']}}
    NeoBundleLazy 'ujihisa/vim-ref'
    NeoBundleLazy 'h1mesuke/unite-outline', {'autoload': {'unite_sources': ['outline']}}
  endif
  " }}}


  " QuickRun / Filer / Outer world of Vim ( "\\" ) {{{
  " --------------------------------------------------------------------------------------------------------
  let mapleader = "\\"
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
  let g:quickrun_config = {'_': {'runner': 'vimproc', 'runner/vimproc/updatetime': 60, 'split': 'vertical', 'into': 1}}
  let s:quickrun_command_list = map(split( 'quickrun;cat,javascript;node,roy;roy,qcl;qcl,haskell;runhaskell,bf;bf', ','), 'split(v:val, ";")')
  if executable('pandoc')
    let g:quickrun_config.markdown = {'type' : 'markdown/pandoc', 'outputter': 'browser', 'cmdopt': '-s'}
  endif
  " let g:quickrun_config.markdown = {'type' : 'markdown/kramdown', 'outputter': 'browser', 'cmdopt': '-s'}
  " let g:quickrun_config['quickrun'] = {'outputter': 'browser'}
  nnoremap <Leader>r :<C-u>QuickRun<CR>
  nnoremap <Leader>e :<C-u>QuickRun <i <CR>
  nnoremap <Leader>o :<C-u>QuickRun <i >file:output<CR>
  autocmd ESC FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> <ESC>:q!<CR>
  autocmd ESC FileType quickrun vnoremap <silent> <buffer> <ESC><ESC> <ESC>:q!<CR>
  if s:nosudo
    NeoBundle 'Shougo/vimfiler'
    let g:vimfiler_as_default_explorer = 1
    " let g:vimfiler_sort_type = 'TIME'
    let g:vimfiler_safe_mode_by_default = 0
    let g:unite_enable_start_insert = 0
    let g:vimfiler_force_overwrite_statusline = 0
    if s:iswin || !has('multi_byte')
      let g:vimfiler_tree_leaf_icon = '|'
      let g:vimfiler_tree_opened_icon = '-'
      let g:vimfiler_tree_closed_icon = '+'
    else
      let g:vimfiler_tree_leaf_icon = ' '
      let g:vimfiler_tree_opened_icon = '▾'
      let g:vimfiler_tree_closed_icon = '▸'
    endif
    let g:vimfiler_file_icon = '-'
    if s:ismac && has('multi_byte')
      let g:vimfiler_readonly_file_icon = '✗'
      let g:vimfiler_marked_file_icon = '✓'
    else
      let g:vimfiler_readonly_file_icon = 'x'
      let g:vimfiler_marked_file_icon = 'v'
    endif
    nnoremap <silent> <Leader>f :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    nnoremap <silent> <Leader><Leader> :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    nnoremap <silent> @<Leader> :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    nnoremap <silent>@@ :<C-u>VimFilerBufferDir -status -buffer-name=vimfiler -auto-cd<CR>
    " nnoremap <silent> s :<C-u>execute 'VimShellCreate '.<SID>current_directory_auto()<CR>
    nnoremap <silent> <S-s> :<C-u>VimShellBufferDir<CR>
    let g:vimfiler_execute_file_list = {}
    for ft in split('pdf,png,jpg,jpeg,gif,bmp,ico,ppt,html', ',')
      let g:vimfiler_execute_file_list[ft] = 'open'
    endfor
    augroup Vimfiler
      autocmd!
      autocmd FileType vimfiler nunmap <buffer> <C-l>
      autocmd FileType vimfiler nunmap <buffer> \
      autocmd FileType vimfiler nnoremap <buffer> <C-l> <ESC><C-w>l
      autocmd FileType vimfiler nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
      autocmd FileType vimfiler nmap <buffer> O <Plug>(vimfiler_sync_with_another_vimfiler)
      autocmd FileType vimfiler nmap <buffer><expr> e
            \ vimfiler#smart_cursor_map("\<Plug>(vimfiler_cd_file)", "\<Plug>(vimfiler_edit_file)")
      autocmd FileType vimfiler if filereadable("Icon\r") | silent call delete("Icon\r") | endif
    augroup END
    NeoBundle 'itchyny/vimfiler-preview', {'type': 'nosync'}
    let g:vimfiler_preview_action = 'auto_preview'
    let bundle = neobundle#get('vimfiler-preview')
    function! bundle.hooks.on_post_source(bundle)
      if exists('*unite#custom_action')
        call unite#custom_action('file', 'auto_preview', g:vimfiler_preview)
      endif
    endfunction
  endif
  NeoBundleLazy 'tyru/open-browser.vim', {'autoload' : {'mappings' : ['<Plug>(openbrowser-']}}
  nmap <silent> <Leader>b <Plug>(openbrowser-smart-search)
  vmap <silent> <Leader>b <Plug>(openbrowser-smart-search)
  nmap <silent> <Leader>s <Plug>(openbrowser-search)
  NeoBundle 'mattn/webapi-vim'
  " }}}

  " ALL {{{
  NeoBundle 'Shougo/vimshell.git'
  " ---------------------------------------------
  NeoBundle 'Changed'
  NeoBundle 'Gundo'                                   " undo履歴を追える
  " NeoBundle 'SQLUtilities'
  " NeoBundle 'bash-support.vim'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'git://github.com/jimsei/winresizer.git'
  NeoBundle 'git://github.com/tpope/vim-surround.git' " テキストを括弧で囲む／削除する
  NeoBundle 'h1mesuke/vim-alignta.git'                " 整形プラグイン Alignのマルチバイト対応版
  NeoBundle 'kwbdi.vim'                               " keep Window on Buffer Delete
  " NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'tomasr/molokai'
  " NeoBundle 'mattn/livestyle-vim'
  " NeoBundle 'tell-k/vim-browsereload-mac'
  NeoBundle 'tomtom/tcomment_vim'                     " コメント処理 \c<Space>
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tyru/vim-altercmd'
  NeoBundle 'yuratomo/w3m.vim.git'
  NeoBundle 'thinca/vim-localrc'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'vim-scripts/tagbar-phpctags'

  " NeoBundle 'Auto-Pairs'
  " NeoBundle 'Indent-Guides'
  " NeoBundle 'Quich-Filter'
  " NeoBundle 'YankRing.vim'                            " YankRing.vim : ヤンクの履歴を管理し、順々に参照、出力できるようにする
  " NeoBundle 'css_color.vim'
  " NeoBundle 'eregex.vim'
  " NeoBundle 'git://github.com/thinca/vim-showtime.git'
  " NeoBundle 'grep.vim'
  NeoBundle 'kana/vim-fakeclip'                " tmuxでyankやpasteの時にOS clipboardを使う
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
  " NeoBundle 'joker1007/vim-markdown-quote-syntax'
  " NeoBundle 'Markdown-syntax'
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
  " NeoBundle 'ruby.vim'
  " NeoBundle 'taichouchou2/vim-rails'
  " NeoBundle 'romanvbabenko/rails.vim'
  " NeoBundle 'tpope/vim-endwise.git'
  " NeoBundle 'ruby-matchit'
  " NeoBundle 'rhysd/unite-ruby-require.vim.git'
  " NeoBundle 'tyru/operator-camelize.vim'            " 選択したテキストオブジェクトをsnake_caseやcamelCaseに変換するオペレーター
  " NeoBundle 'jktgr/vim-json'
  " NeoBundle 'jktgr/phpcomplete.vim'

  " 他のvimpluginから必要にされるもの-----------
  NeoBundle 'mattn/gist-vim'
  " NeoBundle 'cecutil'
  NeoBundle 'L9'
  " }}}
  "
  " PHP & HTML {{{
  if has('multi_byte')
    NeoBundleLazy 'scrooloose/syntastic', {'autoload': {'filetypes': ['php', 'html'], 'functions': ['SyntasticStatuslineFlag']}}
    let g:syntastic_mode_map = { 'mode': 'passive' }
    let g:syntastic_echo_current_error = 0
    " エラー行をsignで表示する
    let g:syntastic_enable_signs = 1
    let g:syntastic_enable_highlighting = 1
    let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
    " let g:syntastic_php_phpcs_args='--standard=psr2'
    let g:syntastic_php_phpcs_post_args='--standard=psr2'
    augroup AutoSyntastic
      autocmd!
      autocmd BufWritePost *.php,*.html call s:syntastic()
    augroup END
    function! s:syntastic()
      if exists(':SyntasticCheck') | exec 'SyntasticCheck' | endif
      if exists('*lightline#update') | call lightline#update() | endif
    endfunction
  endif
  NeoBundleLazy 'html5.vim'                        , {'autoload': {'filetypes': ['html']}}
  NeoBundleLazy 'taku-o/vim-ethna-switch'          , {'autoload': {'filetypes': ['php']}}
  NeoBundleLazy 'watanabe0621/aoi-jump.vim'        , {'autoload': {'filetypes': ['php']}}
  NeoBundleLazy 'jktgr/phpfolding.vim'             , {'autoload': {'filetypes': ['php']}}
  NeoBundleLazy 'pasela/unite-fuel'                , {'autoload': {'filetypes': ['php']}}
  NeoBundleLazy 'watanabe0621/SmartyJump'          , {'autoload': {'filetypes': ['tpl']}}
  NeoBundleLazy 'jktgr/smarty.vim'                 , {'autoload': {'filetypes': ['tpl']}}
  NeoBundleLazy 'bpearson/vim-phpcs'               , {'autoload': {'filetypes': ['php']}}
  NeoBundleLazy 'joonty/vdebug.git'                , {'autoload': {'filetypes': ['php']}}

" autocmd FileType php,ctp : set shiftwidth=4
  autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict | set shiftwidth=4
  let Vimphpcs_Standard='PSR2'               " PHPCSのスタイルを設定

  " Xdebug
  let g:vdebug_options = {
  \    "break_on_open" : 0,
  \    "continuous_mode"  : 1,
  \}

  " PHPの名前空間を保管する設定
  "inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
  "noremap <Leader>e :call PhpExpandClass()<CR>
  " }}}

  " EMMET {{{
  NeoBundleLazy 'mattn/emmet-vim'                  , {'autoload': {'filetypes': ['html','php']}}
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
  " Markdown {{{
  NeoBundleLazy 'git://github.com/itspriddle/vim-marked.git', {'autoload': {'filetypes': ['markdown']}}
  NeoBundleLazy 'VOoM'                                      , {'autoload': {'filetypes': ['markdown']}}          " Vim Outliner of Markers

  nnoremap <silent> <Space>v       : <C-u>Voom markdown<CR>
  " }}}
  " Other {{{
  NeoBundleLazy 'itspriddle/vim-javascript-indent' , {'autoload': {'filetypes': ['javascript']}}
  NeoBundleLazy 'JSON.vim'                         , {'autoload': {'filetypes': ['json']}}
  " NeoBundleLazy 'wavded/vim-stylus', {'autoload': {'filetypes': ['stylus']}}
  " NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': ['less']}}
  " NeoBundleLazy 'less.vim', {'autoload': {'filetypes': ['less']}}
  " NeoBundleLazy 'syntaxm4.vim', {'autoload': {'filetypes': ['m4']}}
  " NeoBundleLazy 'vim-scripts/jade.vim', {'autoload': {'filetypes': ['jade']}}
  " NeoBundleLazy 'vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
  " NeoBundleLazy 'rest.vim', {'autoload': {'filetypes': ['rest']}}
  " NeoBundleLazy 'tpope/vim-markdown', {'autoload': {'filetypes': ['m4']}}
  " NeoBundleLazy 'syngan/vim-vimlint', { 'depends' : 'ynkdir/vim-vimlparser', 'autoload' : { 'functions' : 'vimlint#vimlint'}}
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
  set nowrapscan                                                       " (no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
  set scrolloff=5                                                      " スクロール時の余白確保
  set shiftwidth=2                                                     " >> 等のコマンドや自動インデントの際に使う1レベル分のインデント量
  set showcmd                                                          " コマンドをステータス行に表示
  set smartcase                                                        " 大文字も含めた検索の場合はその通りに検索する
  set softtabstop=4                                                    " タブを入力した際にタブ文字の代わりに挿入されるホワイトスペースの量
  set tabstop=4
  set updatetime=300
  set ttyfast                                                          " 高速ターミナル接続を行う
  set vb t_vb=                                                         " ビープをならさない
  set whichwrap=b,s,h,l,<,>,[,]                                        " カーソルを行頭、行末で止まらないようにする
" let mapleader = ","                                                  " キーマップリーダー
" set imdisable                                                        " insertモードを抜けるとIMEオフ
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" set noimcmdline                                                      " insertモードを抜けるとIMEオフ
" set nolinebreak                                                      " 勝手に改行するのをやめる
  set nrformats=octal                                        " <C-a> <C-x> で英字も増減させる
" set textwidth=0                                                      " 一行に長い文章を書いていても自動折り返しをしない
" set undofile                                                         " アンドゥの履歴をファイルに保存し、Vim を一度終了したとしてもアンドゥやリドゥを行えるようにする

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
  nnoremap <silent> <Space>f  : <C-u>VimFiler          -split -no-quit -simple -winwidth=30  -auto-cd<cR>
  " VimfilerExplorer
  nnoremap <silent> <Space>e  : <C-u>VimFilerExplorer  -split -no-quit -simple -winwidth=30 <CR>


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
  " source ~/.vimrc.plugins_setting

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







" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2



inoremap <C-d> $
inoremap <C-a> @
inoremap <C-j> _
inoremap <C-k> ()




" Enable omni completation {{{
" augroup Omnifunc
"   autocmd!
"   " autocmd FileType c          setlocal omnifunc=ccomplete#Complete
"   " autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
"   " autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
"   " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
"   " autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
"   " autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
"   " autocmd FileType haskell    setlocal omnifunc=necoghc#omnifunc
" augroup END
" setlocal omnifunc=syntaxcomplete#Complete
" }}}
"


" move within insert mode
imap <expr><C-o> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
inoremap <expr> <Up> <SID>cancel_popup("\<Up>")
inoremap <expr> <Down> <SID>cancel_popup("\<Down>")
inoremap <expr> <Left> <SID>cancel_popup("\<Left>")
inoremap <expr> <Right> <SID>cancel_popup("\<Right>")






"-------------------------------------------------------------------------------
" LightLine
"-------------------------------------------------------------------------------

set showtabline=2
set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 150 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 150 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 150 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction






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

let g:winresizer_start_key = '<C-b>'
let g:winresizer_keycode_cancel = 122
let g:winresizer_vert_resize = 3

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
" nmap <Space>bO :OperaReloadStop<CR>
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
let g:github_api_url = 'https://api.git.gree-dev.net'





nnoremap <silent><space>p    :TagbarToggle<CR>
