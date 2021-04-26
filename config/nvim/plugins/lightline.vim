let g:lightline = {
   \ 'colorscheme': 'default',
   \ 'active': {
   \     'left': [ [ 'mode', 'paste' ],
   \               [ 'gitbranch', 'readonly', 'filename', 'modified' ]
   \     ]
   \ },
   \ 'component': {
   \     'lineinfo': '  %3l:%-2v',
   \ },
   \ 'component_function': {
   \     'gitbranch': 'fugitive#head',
   \ }
\}

" let g:lightline.separator = {
"    \     'left': '', 'right': ''
" \}
" 
" let g:lightline.subseparator = {
"    \     'left': '', 'right': ''
" \}
