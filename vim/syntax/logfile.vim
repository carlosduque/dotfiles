" Vim syntax file                                                                                                                                         
" Language:     log

if exists("b:current_syntax")
  finish
endif

" syn match debug ".*DEBUG.*"
syn match exception ".*Exception:.*"
syn match error ".*ERROR.*"
syn match fatal ".*FATAL.*"
syn match info ".*INFO.*"
syn match trace ".*TRACE.*"
syn match warn ".*WARN.*"

hi debug ctermfg=gray guifg=gray
hi error ctermfg=red ctermbg=black guifg=red guibg=black
hi fatal ctermfg=white ctermbg=red guifg=white guibg=red
hi info ctermfg=green guifg=green
hi trace ctermfg=white ctermbg=black guifg=white guibg=black
hi warn ctermfg=yellow guifg=yellow

hi exception ctermfg=red guifg=red

let b:current_syntax = "logfile"
