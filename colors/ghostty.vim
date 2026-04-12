" ================================
" Ghostty Vim Colorscheme
" Exact palette match
" ================================

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ghostty"

" -------- Base --------
hi Normal       ctermfg=15 ctermbg=NONE guifg=#ffffff guibg=#181818
hi Cursor       ctermfg=0  ctermbg=15
hi CursorLine   ctermbg=NONE cterm=underline
hi CursorColumn ctermbg=NONE

hi LineNr       ctermfg=8  guifg=#666666
hi CursorLineNr ctermfg=15 cterm=bold

hi VertSplit    ctermfg=0  ctermbg=NONE
hi StatusLine   ctermfg=15 ctermbg=0 cterm=bold
hi StatusLineNC ctermfg=8  ctermbg=0

hi Visual       ctermfg=0  ctermbg=15
hi IncSearch ctermfg=0 ctermbg=11 guifg=#181818 guibg=#e7c547
hi Search    ctermfg=0 ctermbg=3  guifg=#181818 guibg=#f0c674

hi MatchParen   ctermfg=0  ctermbg=6 cterm=bold guibg=#75b5aa gui=bold

" -------- Syntax (high contrast, red-forward) --------

" Comments: subdued
hi Comment      ctermfg=8  cterm=italic guifg=#666666

" Strings: green
hi String       ctermfg=2  guifg=#b6bd68
hi Character    ctermfg=2

" Numbers / constants: cyan
hi Number       ctermfg=6  guifg=#75b5aa
hi Boolean      ctermfg=6  guifg=#75b5aa
hi Float        ctermfg=6  guifg=#75b5aa
hi Constant     ctermfg=6  guifg=#75b5aa

" Keywords / control flow: RED
hi Keyword      ctermfg=1  guifg=#cc6566
hi Conditional  ctermfg=1
hi Repeat       ctermfg=1
hi Exception    ctermfg=1
hi Statement    ctermfg=1

" Operators: BRIGHT RED for punch
hi Operator     ctermfg=9  guifg=#d54e53

" Functions: yellow (stand out)
hi Function     ctermfg=3  cterm=bold guifg=#f0c674

" Identifiers / variables: blue
hi Identifier   ctermfg=4  guifg=#6a9fb5

" Types / classes: purple
hi Type         ctermfg=5  guifg=#aa759f
hi StorageClass ctermfg=5
hi Structure    ctermfg=5
hi Typedef      ctermfg=5

" Preprocessor / macros: bright purple
hi PreProc     ctermfg=13 guifg=#c28cb8
hi Include     ctermfg=13
hi Define      ctermfg=13
hi Macro       ctermfg=13

" Delimiters / punctuation: light gray
hi Delimiter    ctermfg=7  guifg=#d8d8d8

" Errors / diagnostics: loud red
hi Error        ctermfg=15 ctermbg=1 cterm=bold
hi WarningMsg   ctermfg=11 guifg=#e7c547
hi Todo         ctermfg=9  cterm=bold

" -------- Diagnostics --------
hi Error       ctermfg=15 ctermbg=1  cterm=bold
hi WarningMsg  ctermfg=11
hi Todo        ctermfg=13 cterm=bold

" -------- UI --------
hi Pmenu       ctermfg=15 ctermbg=0
hi PmenuSel    ctermfg=0  ctermbg=4
hi PmenuSbar   ctermbg=8
hi PmenuThumb  ctermbg=15

hi Folded      ctermfg=8 ctermbg=0
hi FoldColumn  ctermfg=8 ctermbg=NONE
