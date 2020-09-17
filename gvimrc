" ******************************************
" GVIM WARNING: for gvim, copy gvimrc as _gvimrc to VIM_HOME
" ******************************************

"set mousehide            "hide the mouse when typing text
colorscheme molokai
"colorscheme iceberg

" set the font
if has('gui_win32')
  set guifont=Lucida_Console:h9:cDEFAULT
elseif has("gui_gtk2")
  "set guifont=ProggyCleanTTSZBP:h12:cDEFAULT
  "set guifont=Dina-medium:h16
  set guifont=Dina\ ttf\ 10px\ 9
elseif has("x11")
  set guifont=Dina\ ttf\ 10px\ 10
  "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
elseif has("mac")
  set guifont=Dina-medium:h16
else
  set guifont=Courier_New:h10:cDEFAULT
endif

