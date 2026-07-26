if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

compiler nature

" Formatting
setl formatoptions+=croql/ formatoptions-=t

" Miscellaneous settings
setl comments=://
setl commentstring=//\ %s
setl iskeyword+=@-@
setl suffixesadd=.n

let b:undo_ftplugin = 'setl cms< com< fo< isk< sua<'

" Follow the nature style guide by default.
if get(g:, 'nature_recommended_style', 1)
  setl expandtab
  setl shiftwidth=4
  setl softtabstop=4
  setl tabstop=4
  setl textwidth=80
  let b:undo_ftplugin .= ' et< sts< sw< ts< tw<'
endif

fu! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+\r\?$//ge
    nohl
    exe "normal `z"
endf

" Auto delete trailing white_space if save.
if get(g:, 'nature_save_cls', 1)
  au BufWrite *.n call DeleteTrailingWS()
endif

augroup nature.vim
  autocmd!
  " Highlight incorrect spacing by default.
  if get(g:, 'nature_space_error', 1)
    au InsertEnter * hi link natureSpaceError NONE
    au InsertLeave * hi link natureSpaceError Error
  endif
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: et sw=2 sts=2 ts=8
