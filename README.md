# lightline-coc

This plugin provides [coc](https://github.com/neoclide/coc.nvim) diagnostics indicator for the [lightline](https://github.com/itchyny/lightline.vim) vim plugin.

## Installation

Install using a plugin manager of your choice, for example:

```viml
Plug 'josa42/vim-lightline-coc'
```

## Integration

1. Register the components:

```viml
let g:lightline = {}
let g:lightline.component_expand = {
  \   'linter_warnings': 'lightline#coc#warnings',
  \   'linter_errors': 'lightline#coc#errors',
  \   'linter_ok': 'lightline#coc#ok',
  \   'status': 'lightline#coc#status',
  \ }
```

2. Set color to the components:

```viml
let g:lightline.component_type = {
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
```

3. Add the components to the lightline, for example to the right side:

```viml
let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
```

## Configuration

* `g:lightline#coc#indicator_warnings`  
  The indicator to use when there are warnings. Default is `•`.

* `g:lightline#coc#indicator_errors`  
  The indicator to use when there are errors. Default is `×`.

* `g:lightline#coc#indicator_ok`  
  The indicator to use when there are no warnings or errors. Default is `✓`.

## Credit

* The plugin is based on [`maximbaz/lightline-ale`](https://github.com/maximbaz/lightline-ale)

## License

[MIT © Josa Gesell](LICENSE)
