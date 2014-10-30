" Syntax file for NoSQL table. v0.1
" Based on VimOutliner syntax file.
"
" Licensed under GPLv2
" Comes with ABSOLUTELY NO WARRANTY: See nosql.txt for details.
"
" Need to set $VIM to wherever you install local plugins.
 
syntax clear
" Comment this line out if want to use this for "plain
" vanilla" TSV files.
"
syntax region LineComment    start=+\/\/+ end=+$+ keepend
syntax region HeaderLine start=++ end=+$+ 
"First field begins at start of a line.
"Note \p for "isprintable" (not )
syntax region Field01 matchgroup=Field01 start=+^[^\/]+ end=+$+ contains=Field02 keepend
"
syntax region Field02 matchgroup=Field02 start=+\t+ end=+$+ contains=Field03 contained keepend
syntax region Field03 matchgroup=Field03 start=+\t+ end=+$+ contains=Field04 contained keepend
syntax region Field04 matchgroup=Field04 start=+\t+ end=+$+ contains=Field05 contained keepend
syntax region Field05 matchgroup=Field05 start=+\t+ end=+$+ contains=Field06 contained keepend
syntax region Field06 matchgroup=Field06 start=+\t+ end=+$+ contains=Field07 contained keepend
syntax region Field07 matchgroup=Field07 start=+\t+ end=+$+ contains=Field08 contained keepend
syntax region Field08 matchgroup=Field08 start=+\t+ end=+$+ contains=Field09 contained keepend
syntax region Field09 matchgroup=Field09 start=+\t+ end=+$+ contains=Field10 contained keepend
syntax region Field10 matchgroup=Field10 start=+\t+ end=+$+ contains=Field11 contained keepend
syntax region Field11 matchgroup=Field11 start=+\t+ end=+$+ contains=Field12 contained keepend
syntax region Field12 matchgroup=Field12 start=+\t+ end=+$+ contains=Field13 contained keepend
syntax region Field13 matchgroup=Field13 start=+\t+ end=+$+ contains=Field14 contained keepend
syntax region Field14 matchgroup=Field14 start=+\t+ end=+$+ contains=Field15 contained keepend
syntax region Field15 matchgroup=Field15 start=+\t+ end=+$+ contains=Field16 contained keepend
syntax region Field16 matchgroup=Field16 start=+\t+ end=+$+ contained keepend

"Can add more fields if needed.
"Be sure to link them below.
"Note that last field must link to Field01 (I think). 

hi link LineComment Comment
hi link HeaderLine PreProc
hi link Field01 Identifier
hi link Field02 Statement
hi link Field03 Special
hi link Field04 Identifier
hi link Field05 Statement
hi link Field06 Special
hi link Field07 Identifier
hi link Field08 Statement
hi link Field09 Special
hi link Field10 Identifier
hi link Field11 Statement
hi link Field12 Special
hi link Field13 Identifier
hi link Field14 Statement
hi link Field15 Special
hi link Field16 Identifier


"Some sane fields.
setlocal tabstop=20
setlocal shiftwidth=20
setlocal noexpandtab
setlocal nosmarttab
