""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs

let s:nerdfont = get(g:, 'nerdfont', 0)

let s:indicator_warnings = get(g:, 'lightline#coc#indicator_warnings', '•')
let s:indicator_errors = get(g:, 'lightline#coc#indicator_errors', '×')
let s:indicator_info = get(g:, 'lightline#coc#indicator_info', '~')
let s:indicator_hints = get(g:, 'lightline#coc#indicator_hints', '>')
let s:indicator_ok = get(g:, 'lightline#coc#indicator_ok', (s:nerdfont ? "\uf058" : '✓'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#coc#warnings() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('warning')
  return l:counts == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts)
endfunction

function! lightline#coc#errors() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('error')
  return l:counts == 0 ? '' : printf(s:indicator_errors . '%d', l:counts)
endfunction

function! lightline#coc#info() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('information')
  return l:counts == 0 ? '' : printf(s:indicator_info . '%d', l:counts)
endfunction

function! lightline#coc#hints() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('hint')
  return l:counts == 0 ? '' : printf(s:indicator_hints . '%d', l:counts)
endfunction

function! lightline#coc#ok() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:countSum()
  return l:counts == 0 ? s:indicator_ok : ''
endfunction

function! lightline#coc#status()
  return get(g:, 'coc_status', '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Register

function! lightline#coc#register() abort
  call s:setLightline('component_expand', 'coc_status', 'lightline#coc#status')
  call s:setLightline('component_expand', 'coc_warnings', 'lightline#coc#warnings')
  call s:setLightline('component_expand', 'coc_errors', 'lightline#coc#errors')
  call s:setLightline('component_expand', 'coc_info', 'lightline#coc#info')
  call s:setLightline('component_expand', 'coc_hints', 'lightline#coc#hints')
  call s:setLightline('component_expand', 'coc_ok', 'lightline#coc#ok')

  call s:setLightline('component_type', 'coc_warnings', 'warning')
  call s:setLightline('component_type', 'coc_errors', 'error')
  call s:setLightline('component_type', 'coc_info', 'info')
  call s:setLightline('component_type', 'coc_hints', 'hint')
  call s:setLightline('component_type', 'coc_ok', 'left')

  call s:setLightline('component_function', 'coc_status', 'lightline#coc#status')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions

function! s:count(level) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, a:level, 0)
endfunction

function! s:countSum() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'error', 0) + get(info, 'warning', 0)
endfunction

function! s:isHidden()
  return exists('*lightline#sensible#isHidden') && lightline#sensible#isHidden()
endfunction

function! s:setLightline(scope, name, value) abort
  let g:lightline = get(g:, 'lightline', {})
  let g:lightline[a:scope] = get(g:lightline, a:scope, {})
  let g:lightline[a:scope][a:name] =  get(g:lightline[a:scope], a:name, a:value)
endfunction


