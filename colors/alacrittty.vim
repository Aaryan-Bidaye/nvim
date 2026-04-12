" ================================
" Ghostty Vim Colorscheme
" Matched to extracted terminal palette
" ================================

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "alacrittty"

" -------- Base --------
hi Normal       ctermfg=7  ctermbg=NONE guifg=#d8d8d8 guibg=#181818
hi Cursor       ctermfg=0  ctermbg=7    guifg=#181818 guibg=#d8d8d8
hi CursorLine   ctermbg=NONE cterm=underline guibg=NONE
hi CursorColumn ctermbg=NONE guibg=NONE

hi LineNr       ctermfg=8  guifg=#6b6b6b
hi CursorLineNr ctermfg=15 cterm=bold guifg=#f8f8f8 gui=bold

hi VertSplit    ctermfg=8  ctermbg=NONE guifg=#6b6b6b guibg=NONE
hi WinSeparator ctermfg=8  ctermbg=NONE guifg=#6b6b6b guibg=NONE

hi StatusLine   ctermfg=15 ctermbg=0 cterm=bold guifg=#f8f8f8 guibg=#181818 gui=bold
hi StatusLineNC ctermfg=8  ctermbg=0          guifg=#6b6b6b guibg=#181818

hi Visual       ctermfg=0  ctermbg=7 guifg=#181818 guibg=#d8d8d8
hi IncSearch    ctermfg=0  ctermbg=11 guifg=#181818 guibg=#feca88
hi Search       ctermfg=0  ctermbg=3  guifg=#181818 guibg=#f4bf75

hi MatchParen   ctermfg=0  ctermbg=6 cterm=bold guifg=#181818 guibg=#75b5aa gui=bold

" -------- Syntax --------

" Comments: subdued
hi Comment      ctermfg=8  cterm=italic guifg=#6b6b6b gui=italic

" Strings: green
hi String       ctermfg=2  guifg=#90a959
hi Character    ctermfg=2  guifg=#90a959

" Numbers / constants: cyan
hi Number       ctermfg=6  guifg=#75b5aa
hi Boolean      ctermfg=6  guifg=#75b5aa
hi Float        ctermfg=6  guifg=#75b5aa
hi Constant     ctermfg=6  guifg=#75b5aa

" Keywords / control flow: red
hi Keyword      ctermfg=1  guifg=#ac4242
hi Conditional  ctermfg=1  guifg=#ac4242
hi Repeat       ctermfg=1  guifg=#ac4242
hi Exception    ctermfg=1  guifg=#ac4242
hi Statement    ctermfg=1  guifg=#ac4242

" Operators: bright red
hi Operator     ctermfg=9  guifg=#c55555

" Functions: yellow
hi Function     ctermfg=3  cterm=bold guifg=#f4bf75 gui=bold

" Identifiers / variables: blue
hi Identifier   ctermfg=4  guifg=#6a9fb5

" Types / classes: purple
hi Type         ctermfg=5  guifg=#aa759f
hi StorageClass ctermfg=5  guifg=#aa759f
hi Structure    ctermfg=5  guifg=#aa759f
hi Typedef      ctermfg=5  guifg=#aa759f

" Preprocessor / macros: bright purple
hi PreProc      ctermfg=13 guifg=#c28cb8
hi Include      ctermfg=13 guifg=#c28cb8
hi Define       ctermfg=13 guifg=#c28cb8
hi Macro        ctermfg=13 guifg=#c28cb8

" Delimiters / punctuation: light gray
hi Delimiter    ctermfg=7  guifg=#d8d8d8

" Errors / diagnostics
hi Error        ctermfg=15 ctermbg=1 cterm=bold guifg=#f8f8f8 guibg=#ac4242 gui=bold
hi WarningMsg   ctermfg=11 guifg=#feca88
hi Todo         ctermfg=13 cterm=bold guifg=#c28cb8 gui=bold

" -------- Diagnostics --------
hi DiagnosticError ctermfg=1  guifg=#ac4242
hi DiagnosticWarn  ctermfg=11 guifg=#feca88
hi DiagnosticInfo  ctermfg=4  guifg=#6a9fb5
hi DiagnosticHint  ctermfg=14 guifg=#93d3c3

" -------- UI --------
hi Pmenu       ctermfg=7  ctermbg=0 guifg=#d8d8d8 guibg=#181818
hi PmenuSel    ctermfg=0  ctermbg=4 guifg=#181818 guibg=#6a9fb5
hi PmenuSbar   ctermbg=8           guibg=#6b6b6b
hi PmenuThumb  ctermbg=15          guibg=#f8f8f8

hi Folded      ctermfg=8 ctermbg=0    guifg=#6b6b6b guibg=#181818
hi FoldColumn  ctermfg=8 ctermbg=NONE guifg=#6b6b6b guibg=NONE

" -------- Floating windows / terminal consistency --------
hi NormalFloat ctermfg=7 ctermbg=0    guifg=#d8d8d8 guibg=#181818
hi FloatBorder ctermfg=8 ctermbg=0    guifg=#6b6b6b guibg=#181818
hi Terminal    ctermfg=7 ctermbg=0    guifg=#d8d8d8 guibg=#181818
hi EndOfBuffer ctermfg=0 ctermbg=NONE guifg=#181818 guibg=NONE
