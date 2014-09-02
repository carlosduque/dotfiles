source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" usar config de Vim y no de Vi
set nocompatible

set guifont=consolas:h9

" para actualizar cuando un archivo es leido desde fuera
set autoread

" permitir el backspace sobre todo en modo insert
set backspace=indent,eol,start

" activar el highlight
syntax on

" enable filetype detection:
filetype on

" para gvim
colorscheme desert

" para que los achivos editados sean UTF-8
set encoding=utf-8

" el folding es manual
set foldmethod=manual

" Iluminar los elementos buscados
set hlsearch

set incsearch

" ignorar el *case* al buscar
set ignorecase

set nobackup

set nowb

set noswapfile

set nowritebackup

" siempre mostrar la posicion actual
set ruler

set showmatch

" cambiar los colores de la barra de estado
hi clear StatusLine
hi clear StatusLineNC
hi statusline cterm=NONE ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi StatusLineNC cterm=NONE ctermbg=black ctermfg=darkgrey guibg=black guifg=lightgreen

" siempre mostrar la barra de estado
set laststatus=2

" configurar la barra de estado
set statusline+=%1*          "color to user mode 1
set statusline+=%<           "where to truncate line if too long
set statusline+=%-F          "full path to file in the buffer
set statusline+=%=           "separation point between left and right aligned items
"set statusline+=%-14.(      "right align
set statusline+=%m           "modified flag
set statusline+=%r           "readonlyflag
set statusline+=%h           "help flag
set statusline+=%w           "preview flag
set statusline+=\|           "pipe
set statusline+=%{&ff}       "current file format
set statusline+=\|           "pipe
set statusline+=%Y           "current filetype
set statusline+=\|           "pipe
set statusline+=%{(&fenc==\"\"?&enc:&fenc)} "encoding
set statusline+=\|           "pipe
set statusline+=\ \-\        "dash separator
set statusline+=[            "open bracket
set statusline+=char:\%03.3b "ASCII value of char
set statusline+=\/           "slash
set statusline+=0x%04B       "HEX value of char
set statusline+=]            "close bracket
set statusline+=\ \-\        "dash separator
set statusline+=\[           "open bracket
set statusline+=L:%03l       "current line in three characters left padded by zeros
set statusline+=\/           "slash
set statusline+=%L           "total lines
set statusline+=\,           "comma
set statusline+=C:%03c       "current column in three characters left padded by zeros
set statusline+=\]           "close bracket
set statusline+=\|           "pipe
set statusline+=%02p%%\        "current % into file followed by the % sign
"set statusline+=%)          "end of item group

" que muestre el *modo* actual
set showmode "show the current mode

"show the partially-typed commands in the status line
set showcmd

"Do not activate wrapping
set nowrap

"Activate line numbers
set number

" ##########################################################
" Comply to PEP 8(Pythons style guide):
" ##########################################################
set autoindent    "al saltar a la siguiente linea q mantenga la  sangria
set expandtab     "para que al presionar tab, inserte espacios y no \\t
set shiftwidth=2  "no estoy seguro para que es esto
set shiftround    "esto tampoco
set tabstop=2     "un tab de 4 espacios

" para que vim vea los 4 espacios seguidos del tabstop y funcione el backspace eliminando los 4
set softtabstop=2

set textwidth=120

" para usar 'aspell' usando ctrl+t 
" map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

