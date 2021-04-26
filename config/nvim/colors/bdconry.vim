" Vim color file
" Maintainer: Brian Conry
" Last Change: 2007/05/20
" URL:
" ICQ:
" Info: based on many
" Version: 0.1

set background=dark
hi clear

if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="bdconry"

hi Normal        guifg=grey70  ctermfg=grey guibg=grey14  ctermbg=black
hi NonText       guifg=#5050ff              guibg=black                 gui=NONE
hi Comment       guifg=#80a0ff
hi perlDATA      guifg=#80a0ff              guibg=black
hi perlPOD       guifg=#80a0ff              guibg=grey30
hi String                                   guibg=black
hi Special       guifg=orange               guibg=black
hi Constant      guifg=#f0a0a0
hi SpecialKey                               guibg=grey25
hi Identifier    guifg=#60efef
hi Function      guifg=#cf70cf
hi Statement                                                            gui=NONE
hi StorageClass  guifg=#408040
hi Repeat        guifg=#d05010 ctermfg=brown
hi Type                                                                 gui=NONE

hi Menu          guifg=black                guibg=grey50
hi Scrollbar     guifg=black                guibg=grey50
hi VertSplit     guifg=grey30
hi StatusLine    guifg=white                guibg=grey30                gui=reverse
hi StatusLineNC  guifg=grey30               guibg=grey70
hi Folded        guifg=black
hi Cursor        guifg=black                guibg=white

hi DiffDelete                                                           gui=NONE

hi link perlMethod perlFunction
hi link perlFunctionName perlFunction
hi link perlStatementFlow perlRepeat
hi link perlStatementControl perlRepeat
hi link perlStatementStorage Type

