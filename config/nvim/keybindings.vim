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
" operator modes (:map and :noremap)
"    normal mode (:nmap and :nnoremap)
"    visual mode (:vmap and :vnoremap)
" and so on.

" Redo
nnoremap U <C-R>

" Visual block tabbing
vnoremap < <gv
vnoremap > >gv

" Quit
nnoremap q :q<CR>

" Window navigation
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
" Window navigation OSX
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Disable arrow keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Conventional save file
nnoremap <C-s> :w<CR>

" resize split windows height:   <C-W>+ | <C-W>-
" resize vertical windows width: <C-W>> | <C-W><
" resize to equal dimensions:    <C-W>=
" resize to maximum size:        <C-W>_

" vim's builtin explorer, useful for renaming current file
map <leader>ex :Explore<CR>
" set current files dir, as vim's ccd
map <leader>mkhome :cd %:p:h<CR>
map <leader>nt :NERDTreeToggle<CR>
map <leader>tb :TagbarToggle<CR>
map <leader>rb :RainbowParentheses!!<CR>
map <leader>ag :Ag!<space>
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

inoremap jj <esc> " use jj in insert mode to go back to normal mode

nmap <leader>md :%!~/bin/Markdown.pl --html4tags <CR>
nmap <silent> <leader>evim :vsplit $MYVIMRC<cr>
nmap <silent> <leader>egvim :vsplit $HOME/.gvimrc<cr>
nmap <silent> <leader>svim :source $MYVIMRC<cr>
nmap <silent> <leader>sgvim :source $HOME/.gvimrc<cr>
nmap <silent> <leader>etmux :vsplit ~/.tmux.conf<cr>
nmap <silent> <leader>ezshrc :vsplit ~/.zshrc<cr>

noremap <C-l> :nohlsearch<CR>
" Disable h j k l (learn to use wordwise motions !!)
" w | W:   [count] words/WORDS forward
" e | E:   [count] forward to the end of word/WORD
" b | B:   [count] word/WORD backwards
" ge | gE: [count] backwards to the end of word/WORD
" ( | ) : [count] sentences backward/forward
" { | } : [count] paragraphs backward/forward
" noremap h <nop>
" noremap j <nop>
" noremap k <nop>
" noremap l <nop>

nnoremap <leader>c :set cursorline! cursorcolumn!<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>n :setlocal number!<cr>
nnoremap <leader>nr :setlocal relativenumber!<cr>
nnoremap <leader>wrp :set wrap!<cr>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

