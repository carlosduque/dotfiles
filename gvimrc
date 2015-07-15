set mousehide            "hide the mouse when typing text
colorscheme molokai

" set the font
if has('gui_win32')
  set guifont=Lucida_Console:h9:cDEFAULT
"elseif has("gui_gtk2")
  "set guifont=ProggyCleanTTSZBP:h12:cDEFAULT
elseif has("x11")
  set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
else
  set guifont=Courier_New:h10:cDEFAULT
endif



