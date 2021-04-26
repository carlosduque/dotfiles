if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'tpope/vim-surround'                   " add command to create surrounding parens
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'                   " add command to show git info in status line
Plug 'itchyny/lightline.vim'
" Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'                 " comments
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'                  " rainbow parens
" Plug 'jlanzarotta/bufexplorer'            " javascript
" Plug 'kjssad/quantum.vim'                 " firefox theme
" Plug 'sheerun/vim-polyglot'               " better default syntax
" Plug 'pangloss/vim-javascript'            " javascript
" Plug 'leafgarland/typescript-vim'         " typescript 
" Plug 'maxmellon/vim-jsx-pretty'           " js / jsx 
" Plug 'peitalin/vim-jsx-typescript'        " tsx
" Plug 'jparise/vim-graphql'                " graphql
" Plug 'Olical/conjure', {'tag': 'v3.3.0'}  " clojure
" Plug 'kelvin-mai/vim-cljfmt'              " clojure formatter
" Plug 'reasonml-editor/vim-reason-plus'    " reasonml
" Editor features
" Plug 'chun-yang/auto-pairs'               " automatic paren completion
" Plug 'airblade/vim-gitgutter'             " git gutter
" Plug 'rhysd/conflict-marker.vim'          " git conflict marker
" Fuzzy finder
" Plug 'airblade/vim-rooter'
" Intellisense
" Plug 'neoclide/coc.nvim', {'branch': 'release' } 
" Emacs which keys
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Status Line

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


