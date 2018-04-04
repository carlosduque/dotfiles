" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:  Ron Aaron <ron@ronware.org>
" Last Change:  2003 May 02

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "xibalba"

hi Boolean            ctermfg=Magenta
hi Character          ctermfg=144
hi Comment            ctermfg=8                                                                       guifg=#808080
hi Constant           ctermfg=DarkGreen                         cterm=none   term=underline           guifg=#ffa0a0   guibg=grey5     gui=none 
hi CursorLine         ctermfg=White         ctermbg=214         cterm=none                            guifg=white     guibg=darkmagenta 
hi CursorLineNr       ctermfg=214                                                                     guifg=#0000ff
hi CursorColumn       ctermfg=White         ctermbg=214         cterm=none                            guifg=white     guibg=darkmagenta 
hi Directory          ctermfg=DarkGreen                                                                       guifg=#00c000
hi Error                                    ctermbg=9                                                                 guibg=#ff0000
hi Float              ctermfg=Yellow
"hi Function           ctermfg=LightMagenta
"hi Function           ctermfg=Magenta
hi Function           ctermfg=135
"hi Function           ctermfg=Red
"hi Identifier         ctermfg=6                                                                       guifg=#00c0c0
hi Identifier         ctermfg=White                                                                       guifg=#00c0c0
"hi Label              ctermfg=229                       cterm=none
"hi LineNr             ctermfg=Yellow                                                                  guifg=#0000ff
hi LineNr             ctermfg=241                                                                     guifg=#0000ff
"hi Normal                                                                                             guifg=#ffffff   guibg=#000000
hi Number             ctermfg=Yellow                                                                       guifg=#0000ff
"hi Operator           ctermfg=117
hi PreProc            ctermfg=DarkCyan                                                                      guifg=#00ff00
hi Special            ctermfg=Cyan                                                                 guifg=#0000ff
hi SpecialKey         ctermfg=Yellow                                                                 guifg=#0000ff
hi Statement          ctermfg=DarkRed                           cterm=none                            guifg=#c0c000                   gui=bold
hi StatusLine         ctermfg=11            ctermbg=12          cterm=none                            guifg=#ffff00   guibg=#0000ff   gui=none
hi Search                                   ctermbg=3                                                                 guibg=#c0c000
hi Type               ctermfg=2                                                                       guifg=#00c000
hi Todo               ctermfg=4             ctermbg=3                                                 guifg=#000080   guibg=#c0c000

