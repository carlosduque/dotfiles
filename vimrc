" Basics ---{{{
execute pathogen#infect()
call pathogen#helptags()          "generate helptags for everything in ‘runtimepath’

filetype plugin indent on         "enable filetype detection:

set nocompatible                  "usar config de Vim y no de Vi
set encoding=utf-8                "para que los achivos editados sean UTF-8
set backspace=indent,eol,start    "permitir el backspace sobre todo en modo insert
set guifont=consolas:h9
set autoread                      "para actualizar cuando un archivo es leido desde fuera
set clipboard=unnamed   "use the system clipboard
set ruler               "siempre mostrar la posicion actual
set cursorline          "highlight all the line of the cursor
:hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorcolumn        "highlight all the column of the cursor
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Searching and movement ---{{{
set hlsearch            "highlight search
set incsearch           "incremental searches
set ignorecase          "ignorar el *case* al buscar
set smartcase
set showmatch           "set show matching parenthesis

" Fold ---{{{
set foldmethod=indent   "el folding puede ser manual, indent, syntax, expr


" Resize splits when the window is resized
au VimResized * :wincmd =

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


" Tabs, spaces and wrapping ---{{{
set tabstop=4           "un tab de 4 espacios
set softtabstop=4       "para que vim vea los 4 espacios seguidos del tabstop y funcione el backspace eliminando los 4
set smarttab            "insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftwidth=4        "number of spaces to use for autoindentingno estoy seguro para que es esto
set expandtab           "para que al presionar tab, inserte espacios y no \\t
set nowrap              "don't activate wrapping
set textwidth=120       "numero de columnas
set colorcolumn=+1      "show when you are beyond textwidth

" Backups ---{{{
set nobackup
set noswapfile          "no temp file
set nowb                "prevents automatic write backup

" Color scheme ---{{{
syntax on                         "activar el highlight
colorscheme desert                "molokai, desert

" Spell ---{{{
"set spell
"set spelllang=es
"set dictionary=/usr/share/dict/words
"set spellfile=~/.vim/custom-dict.utf-8.add,~/.vim-local-dict.utf-8.add

" Indentation ---{{{
set autoindent          "al saltar a la siguiente linea q mantenga la  sangria
set copyindent          "copy the previous indentation on autoindenting
set showmode            "show the current mode
set showcmd             "show the partially-typed commands in the status line
set shiftround          "use multiple of shiftwidth when indenting with '<' and '>'

" History and Undo ---{{{
set history=1000        "remember more commands and search history
set undolevels=1000     "use many levels of undo

" Status bar ---{{{
set laststatus=2        "siempre mostrar la barra de estado
" cambiar los colores de la barra de estado
:hi clear StatusLine
:hi statusline cterm=NONE ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
:hi clear StatusLineNC
:hi StatusLineNC cterm=NONE ctermbg=black ctermfg=darkgrey guibg=black guifg=lightgreen
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
set statusline+=<            "
set statusline+=%{&ff}       "current file format
set statusline+=\|           "pipe
set statusline+=%Y           "current filetype
set statusline+=\|           "pipe
set statusline+=%{(&fenc==\"\"?&enc:&fenc)} "encoding
set statusline+=>            "
"set statusline+=\ \-\        "dash separator
"set statusline+=[            "open bracket
"set statusline+=char:\%03.3b "ASCII value of char
"set statusline+=\/           "slash
"set statusline+=0x%04B       "HEX value of char
"set statusline+=]            "close bracket
"set statusline+=\ \-\        "dash separator
set statusline+=\ \[        "dash separator
set statusline+=ln:%03l       "current line in three characters left padded by zeros
set statusline+=\/           "slash
set statusline+=%L           "total lines
set statusline+=\,           "comma
set statusline+=\ col:%03c     "current column in three characters left padded by zeros
set statusline+=\]           "close bracket
set statusline+=\ \-\        "pipe
set statusline+=%02p%%\      "current % into file followed by the % sign
"set statusline+=%)           "end of item group

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" Key bindings ---{{{
let mapleader=","  "set ',' instead of '\' as <leader>

" para usar 'aspell' usando ctrl+t 
" map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>
map <leader>nt :NERDTreeToggle<CR>

" convert markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" Quickly editing ---{{{
nmap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nmap <silent> <leader>sv :source $MYVIMRC<cr>
nmap <silent> <leader>et :vsplit ~/.tmux.conf<cr>

" toggle line wrapping
nnoremap <leader>w :set wrap!

" toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" toggle cursorline/cursorcolumn
nnoremap <leader>c :set cursorline! cursorcolumn!<cr>

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

