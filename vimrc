source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Pathogen
execute pathogen#infect()
call pathogen#helptags()          "generate helptags for everything in ‘runtimepath’

syntax on                         "activar el highlight
filetype plugin indent on         "enable filetype detection:
colorscheme desert                "para gvim

set nocompatible                  "usar config de Vim y no de Vi
set encoding=utf-8                "para que los achivos editados sean UTF-8
set guifont=consolas:h9
set autoread                      "para actualizar cuando un archivo es leido desde fuera
set clipboard=unnamed   "use the system clipboard

set foldmethod=indent   "el folding puede ser manual, indent, syntax, expr
set backspace=indent,eol,start    "permitir el backspace sobre todo en modo insert
set hlsearch            "iluminar los elementos buscados
set incsearch
set ignorecase          "ignorar el *case* al buscar
set nowrap              "don't activate wrapping
set number              "activate line numbers
set nowb
set ruler               "siempre mostrar la posicion actual
set showmatch           "set show matching parenthesis
set showmode            "show the current mode
set showcmd             "show the partially-typed commands in the status line
set nobackup
set noswapfile          "no temp file
set nowritebackup

set autoindent          "al saltar a la siguiente linea q mantenga la  sangria
set copyindent          "copy the previous indentation on autoindenting
set expandtab           "para que al presionar tab, inserte espacios y no \\t
set shiftwidth=4        "number of spaces to use for autoindentingno estoy seguro para que es esto
set shiftround          "use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=4           "un tab de 4 espacios
set softtabstop=4       "para que vim vea los 4 espacios seguidos del tabstop y funcione el backspace eliminando los 4
set textwidth=120       "numero de columnas antes
set smarttab            "insert tabs on the start of a line according to shiftwidth, not tabstop
set history=1000        "remember more commands and search history
set undolevels=1000     "use many levels of undo

set laststatus=2        "siempre mostrar la barra de estado
" cambiar los colores de la barra de estado
hi clear StatusLine
hi clear StatusLineNC
hi statusline cterm=NONE ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi StatusLineNC cterm=NONE ctermbg=black ctermfg=darkgrey guibg=black guifg=lightgreen

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

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
set statusline+=Ln:%03l       "current line in three characters left padded by zeros
set statusline+=\/           "slash
set statusline+=%L           "total lines
set statusline+=\,           "comma
set statusline+=\ Col:%03c     "current column in three characters left padded by zeros
set statusline+=\]           "close bracket
set statusline+=\ \-\        "pipe
set statusline+=%02p%%\      "current % into file followed by the % sign
"set statusline+=%)           "end of item group

" ##########################################################
" Key bindings 
" ##########################################################
let mapleader=","  "set ',' instead of '\' as <leader>
" para usar 'aspell' usando ctrl+t 
" map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>
map <leader>nt :NERDTreeToggle<CR>
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" map Silver Searcher
map <leader>a :Ag!<space>

" search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" execute current file
map <leader>e :call ExecuteFile(expand("%"))<cr>

" execute file if we know how
function! ExecuteFile(filename)
  :w
  :silent !clear
  if match(a:filename, '\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.js$') != -1
    exec ":!node " . a:filename
  elseif match(a:filename, '\.sh$') != -1
    exec ":!bash " . a:filename
  else
    exec ":!echo \"Don't know how to execute: \"" . a:filename
  end
endfunction

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

