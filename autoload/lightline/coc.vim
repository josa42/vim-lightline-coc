""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs

let s:indicator_warnings = get(g:, 'lightline#coc#indicator_warnings', '•')
let s:indicator_errors = get(g:, 'lightline#coc#indicator_errors', '×')
let s:indicator_ok = get(g:, 'lightline#coc#indicator_ok', '✓')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#coc#warnings() abort
  if lightline#coc#isHidden()
    return ''
  endif

  let l:counts = lightline#coc#count('warning')
  return l:counts == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts)
endfunction

function! lightline#coc#errors() abort
  if lightline#coc#isHidden()
    return ''
  endif

  let l:counts = lightline#coc#count('error')
  return l:counts == 0 ? '' : printf(s:indicator_errors . '%d', l:counts)
endfunction

function! lightline#coc#ok() abort
  if lightline#coc#isHidden()
    return ''
  endif

  let l:counts = lightline#coc#countSum()
  return l:counts == 0 ? s:indicator_ok : ''
endfunction

function! lightline#coc#status()
  if lightline#coc#isHidden()
    return ''
  endif

  return get(g:, 'coc_status', '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions

function! lightline#coc#count(level) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, a:level, 0)
endfunction

function! lightline#coc#countSum() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'error', 0) + get(info, 'warning', 0)
endfunction

function! lightline#coc#isHidden()
  let filetypes = ['nerdtree', 'startify', 'list']
  let filenames = ['[Plugins]', '__vista__', 'startify', 'NERDTree']
  return index(filetypes, &filetype) != -1 || index(filenames, expand('%:t')) != -1
endfunction

