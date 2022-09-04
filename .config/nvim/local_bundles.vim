"*****************************************************************************
"" Shougo
"*****************************************************************************
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler'
Plug 'Shougo/unite-outline'
let g:unite_enable_start_insert = 1
let g:unite_cursor_line_highlight = 'CursorLine'
nnoremap <silent><space>/     :Unite line                   -buffer-name=line       -direction=rightbelow      -no-quit <CR>
nnoremap <silent><space>r     :Unite file_mru      bookmark -buffer-name=file_mru   -direction=rightbelow<CR>
nnoremap <silent><space>f     :Unite file                   -buffer-name=files      -direction=rightbelow<CR>
nnoremap <silent><space>o     :Unite outline                -buffer-name=outline    -vertical    -winwidth=30  -no-quit <CR>
nnoremap <silent><space>l     :Unite buffer_tab             -buffer-name=buffer_tab -direction=rightbelow<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:unite_enable_start_insert = 1

" CurrentBufferFile List
nnoremap <silent> <Space>b  : <C-u>VimFilerBufferDir -split -no-quit -simple -winwidth=30<CR>
" CurrentDirFileList
nnoremap <silent> <Space>c  : <C-u>VimFiler                          -simple -winwidth=30  -auto-cd<cR>
" VimfilerExplorer
nnoremap <silent> <Space>e  : <C-u>VimFilerExplorer  -split -no-quit -simple -winwidth=30 <CR>



"*****************************************************************************
"" Markdown
"*****************************************************************************
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
