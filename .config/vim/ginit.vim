" Enable Mouse
set mouse=a

" https://github.com/equalsraf/neovim-qt/issues/732
Guifont! UDEV Gothic Regular:h16

" simaltの最大化と元のサイズの戻すの代わり
nnoremap <Leader>ma :<C-u>call GuiWindowMaximized(1)<CR>
nnoremap <Leader>mi :<C-u>call GuiWindowMaximized(0)<CR>

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
