augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END

let g:lightline = get(g:, 'lightline', {})
let g:lightline['component_expand'] = get(g:lightline, 'component_expand', {})
let g:lightline['component_type'] = get(g:lightline, 'component_type', {})

let g:lightline['component_expand']['coc_status'] = 'lightline#coc#status'
let g:lightline['component_expand']['coc_warnings'] = 'lightline#coc#warnings'
let g:lightline['component_expand']['coc_errors'] = 'lightline#coc#errors'
let g:lightline['component_expand']['coc_ok'] = 'lightline#coc#ok'

let g:lightline['component_type']['coc_warnings'] = 'warning'
let g:lightline['component_type']['coc_errors'] = 'error'
let g:lightline['component_type']['coc_ok'] = 'left'

