
" Basics ---{{{
execute pathogen#infect()
call pathogen#helptags()          "generate helptags for everything in ‘runtimepath’

filetype plugin indent on         "enable filetype detection:

set nocompatible                  "usar config de Vim y no de Vi
set encoding=utf-8                "para que los achivos editados sean UTF-8
set backspace=indent,eol,start    "permitir el backspace sobre todo en modo insert
set guifont=consolas:h9
set autoread                      "para actualizar cuando un archivo es leido desde fuera
set clipboard=unnamed             "use the system clipboard
set noruler                       "no mostrar info con posicion actual, esto se hara con statusbar
set hidden                        "hide buffers when not displayed

" Color scheme ---{{{
syntax on                         "activar el highlight
colorscheme desert                "molokai, desert
set t_Co=256                      "force 256 colors on the terminal
set nocursorline                  "don't highlight all the line of the cursor
hi CursorLine cterm=NONE ctermbg=darkmagenta ctermfg=white guibg=darkmagenta guifg=white
set nocursorcolumn        "don't highlight all the column of the cursor
hi CursorColumn cterm=NONE ctermbg=darkmagenta ctermfg=white guibg=darkmagenta guifg=white
let g:airline_theme             = 'molokai'

" Searching and movement ---{{{
set hlsearch            "highlight search
set incsearch           "incremental searches
set ignorecase          "ignorar el *case* al buscar
set smartcase
set showmatch           "set show matching parenthesis

" Fold ---{{{
set foldmethod=manual   "el folding puede ser manual, indent, syntax, expr

" Tabs, spaces and wrapping ---{{{
set tabstop=4           "un tab de 4 espacios
set softtabstop=4       "para que vim vea los 4 espacios seguidos del tabstop y funcione el backspace eliminando los 4
set smarttab            "insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftwidth=4        "number of spaces to use for autoindentingno estoy seguro para que es esto
set expandtab           "para que al presionar tab, inserte espacios y no \\t
set nowrap              "don't activate wrapping
set textwidth=120       "numero de columnas
set colorcolumn=+1      "show when you are beyond textwidth
hi ColorColumn cterm=NONE ctermbg=darkcyan ctermfg=white guibg=darkcyan guifg=white
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ "display tabs and trailing spaces

" Backups ---{{{
set nobackup
set noswapfile          "no temp file
set nowb                "prevents automatic write backup

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
" configurar la barra de estado
"set statusline+=%1*          "color to user mode 1
"set statusline+=%<           "where to truncate line if too long
"set statusline+=%-F          "full path to file in the buffer
"set statusline+=%=           "separation point between left and right aligned items
"set statusline+=%-14.(      "right align
"set statusline+=%m           "modified flag
"set statusline+=%r           "readonlyflag
"set statusline+=%h           "help flag
"set statusline+=%w           "preview flag
"set statusline+=<            "
"set statusline+=%{&ff}       "current file format
"set statusline+=\|           "pipe
"set statusline+=%Y           "current filetype
"set statusline+=\|           "pipe
"set statusline+=%{(&fenc==\"\"?&enc:&fenc)} "encoding
"set statusline+=>            "
"set statusline+=\ \-\        "dash separator
"set statusline+=[            "open bracket
"set statusline+=char:\%03.3b "ASCII value of char
"set statusline+=\/           "slash
"set statusline+=0x%04B       "HEX value of char
"set statusline+=]            "close bracket
"set statusline+=\ \-\        "dash separator
"set statusline+=\ \[        "dash separator
"set statusline+=c:%03c,     "current column in three characters left padded by zeros
"set statusline+=l:%03l       "current line in three characters left padded by zeros
"set statusline+=\/           "slash
"set statusline+=%L           "total lines
"set statusline+=\]           "close bracket
"set statusline+=\ \-\        "space + dash
"set statusline+=%02p%%\      "current % into file followed by the % sign
"set statusline+=%)           "end of item group

" Key bindings ---{{{
let mapleader=","  "set ',' instead of '\' as <leader>

" Note: on remap, noremap, nnoremap and vnoremap
" remap is an option that makes mappings work recursively.
" :map and :noremap are recursive and non-recursive versions of the various mapping commands.
" What that means is that if you do:
"    :map j gg
"    :map Q j
"    :noremap W j
"
" j will be mapped to gg. Q will also be mapped to gg, because j will be expanded for the recursive mapping.
" W will be mapped to j (and not to gg) because j will not be expanded for the non-recursive mapping.
" operartor modes (:map and :noremap)
"    normal mode (:nmap and :nnoremap)
"    visual mode (:vmap and :vnoremap)
" and so on.

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable h j k l (learn to use wordwise motions !!)
" noremap h <nop>
" noremap j <nop>
" noremap k <nop>
" noremap l <nop>

inoremap jj <esc> " use jj in insert mode to go back to normal mode

" >>> easymotion
" <leader><leader>w (<plug>(easymotion-w)) to trigger the word motion w

" para usar 'aspell' usando ctrl+t
" map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

" >>> NERDTree
map <leader>nt :NERDTreeToggle<CR>

" >>> ctrlp
" :CtrlP or :CtrlPBuffer or : CtrlPMRU or :CtrlPMixed to search in files, buffers and MRU files
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore
" options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them
map <leader>cp :CtrlP<CR>
" or just plain ctrl+p :-)

" >>> bufexplorer
" <leader>be (normal open)
" <leader>bs (force horizontal split open)
" <leader>bv (force vertical split open)

" convert markdown to html
nmap <leader>md :%!~/bin/Markdown.pl --html4tags <CR>

" Quickly editing
nmap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nmap <silent> <leader>sv :source $MYVIMRC<cr>
nmap <silent> <leader>et :vsplit ~/.tmux.conf<cr>
nmap <silent> <leader>ez :vsplit ~/.zshrc<cr>

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

" Functions ---{{{
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

" Autosave files when losing focus
au FocusLost * :wa
