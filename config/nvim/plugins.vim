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
Plug 'jlanzarotta/bufexplorer'              " easy navigation through buffers

Plug 'tpope/vim-fugitive'                   " add command to show git info in status line
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'                " status line
" Plug 'bling/vim-airline'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'Olical/conjure', {'tag': 'v3.3.0'}  " clojure
Plug 'luochen1990/rainbow'                  " rainbow parens
Plug 'sheerun/vim-polyglot'               " better default syntax
" Plug 'kelvin-mai/vim-cljfmt'              " clojure formatter
" Plug 'tpope/vim-commentary'                 " comments
" Plug 'junegunn/goyo.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release' } 
" Plug 'kjssad/quantum.vim'                 " firefox theme
" Plug 'pangloss/vim-javascript'            " javascript
" Plug 'leafgarland/typescript-vim'         " typescript 
" Plug 'maxmellon/vim-jsx-pretty'           " js / jsx 
" Plug 'peitalin/vim-jsx-typescript'        " tsx
" Plug 'jparise/vim-graphql'                " graphql
" Plug 'reasonml-editor/vim-reason-plus'    " reasonml
" Editor features
" Plug 'chun-yang/auto-pairs'               " automatic paren completion
" Plug 'airblade/vim-gitgutter'             " git gutter
" Plug 'rhysd/conflict-marker.vim'          " git conflict marker
" Plug 'airblade/vim-rooter'
" Intellisense

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


