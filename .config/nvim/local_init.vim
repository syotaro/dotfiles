set clipboard=unnamed,unnamedplus                                    " OSのクリップボードを使用する
set display=lastline                                                 " 一行の文字数が多くてもきちんと描画
set expandtab                                                        " タブを入力した際に自動でホワイトスペースに展開しない
set list                                                             " 不可視文字表示
set listchars=tab:▸\ ,trail:_,extends:>,precedes:<,nbsp:%            " 不可視文字の表示形式
set matchtime=3                                                      " 対応括弧の表示秒数を3秒にする"
set mouse=a                                                          " マウスモード有効
set nobackup                                                         " Directories for swp files
set nonumber
set noruler
set noswapfile                                                       " Directories for swp files
set noundofile                                                       " Directories for swp files
set nowrap                                                           " 折り返ししない
set nowrapscan                                                       " 検索時にファイルの最後まで行ったら最初に戻らないようにする
set shiftwidth=2
set showmatch
set whichwrap=b,s,h,l,<,>,[,]                                        " カーソルを行頭、行末で止まらないようにする

if &diff " ignore white-space
    set diffopt+=iwhite
end


" 選択部分を、コピーせずに削除
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP


" 全角文字をハイライトして表示
function! Zenkaku()
    highlight Zenkaku cterm=reverse ctermfg=red gui=reverse guifg=red
endfunction

if has('syntax')
    augroup Zenkaku
        autocmd!
        autocmd ColorScheme       * call Zenkaku()
        autocmd VimEnter,WinEnter * let w:m1 = matchadd("Zenkaku", '[　０１２３４５６７８９]')
        autocmd VimEnter,WinEnter * let w:m2 = matchadd("Zenkaku", '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
        autocmd VimEnter,WinEnter * let w:m3 = matchadd("Zenkaku", '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
    augroup END
    call Zenkaku()
endif

"-------------------------------------------------------------------------------
" [Keybind]
"-------------------------------------------------------------------------------
command! Ev        edit   $MYVIMRC                         " vimrcの編集
command! Evl       edit   ~/.config/nvim/local_init.vim    " vimrc.localの編集
command! Evlb      edit   ~/.config/nvim/local_bundles.vim " vimrc.local.bundlesの編集
command! Rv        source $MYVIMRC                         " vimrcの反映

" 行末、行の最初への移動のキーマップ設定
map! <C-e> <Esc>$
map  <C-e> <Esc>$
" 全選択
noremap AA ggVG

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
" Ctrl + c とEscの動作を完全に一致させる
inoremap <C-c> <ESC>

" ファイル保存及びsyntax check(バッファ変更時のみ)
nnoremap <silent> <Space>s     :<C-u>update<CR>
" syntax check
nnoremap <silent> <Leader>s    :<C-u>SyntasticCheck<CR>

" space + ? で各種設定をトグル
nnoremap <silent> <Space><S-s> :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> <Space>l     :setl list!<CR>:setl list?<CR>
nnoremap <silent> <Space>n     :setl number!<CR>:setl number?<CR>
nnoremap <silent> <Space>w     :setl wrap!<CR>:setl wrap?<CR>

" 行末までをヤンク
nnoremap Y y$

nmap <C-l> >>
nmap <C-h> <<

" map <C-a> <Esc>
map! <C-b> <Esc>h
map! <C-f> <Esc>l
map  <C-b> <Left>
map  <C-f> <Right>

" タブ移動を直感的に
noremap gh gT
noremap gl gt

 " C-j, C-kで1行スクロール
noremap <C-j> <C-e>
noremap <C-k> <C-y>


" paste yanked string vertically。<C-v> 時に<C-p> でvertical に paste
vnoremap <C-p> I<C-r>"<ESC><ESC>

" visualモードで置き換えたい文字を選択した後、「p」で0のレジスターを使用する(visualモードで選択したあとに、ヤンクした文字をペーストするとその置き換えた文字がヤンクされてしまい2回目同じようにしようとすると、前回置き換えた文字がペーストされてしまうので）
vnoremap <silent> p "0p<CR>

" qでウインドウを閉じて Qでマクロ
nnoremap q :<C-u>q<CR>
nnoremap Q q

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

" inoremap <C-d> $
inoremap <C-a> @
"inoremap <C-j> _
inoremap <C-k> ()<Left>
inoremap <C-l> <Esc>>>


"-------- コマンドラインでのキーバインド
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


" バッファ上の内容をワンコマンドでファイル保存
let $TODAY = strftime('%Y%m%d%H%M')
nnoremap <silent><Space>d :save! ~/Desktop/$TODAY.md<CR>
inoremap <C-d> <ESC>      :save! ~/Desktop/$TODAY.md<CR>

"*****************************************************************************
"" Other
"*****************************************************************************
autocmd BufRead *.sql            setf mysql      " .sqlは、mysqlとして扱う
autocmd BufRead *.tsv            set tabstop=24
