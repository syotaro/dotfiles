" Vim syntax file
" Language:     Github Flavored Markdown
" Markdown.vim Maintainer: Tim Pope <vimNOSPAM@tpope.org>
" GFM Maintainer: Jeff Tratner <github.com/jtratner>
" Filenames:    *.ghmarkdown
" Last Change:	2013 June 8
" (nearly the same as tpope's markdown.vim, with a few 
" add-ons for Github Flavored Markdown)

syn region markdownItalic start="\<\*\|\*\>" end="\<\*\|\*\>" keepend contains=markdownLineStart
syn region markdownItalic start="\<_\|_\>" end="\<_\|_\>" keepend contains=markdownLineStart
syn region markdownBold start="\<\*\*\|\*\*\>" end="\<\*\*\|\*\*\>" keepend contains=markdownLineStart,markdownItalic
syn region markdownBold start="\<__\|__\>" end="\<__\|__\>" keepend contains=markdownLineStart,markdownItalic
syn region markdownBoldItalic start="\<\*\*\*\|\*\*\*\>" end="\<\*\*\*\|\*\*\*\>" keepend contains=markdownLineStart
syn region markdownBoldItalic start="\<___\|___\>" end="\<___\|___\>" keepend contains=markdownLineStart
