augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END

