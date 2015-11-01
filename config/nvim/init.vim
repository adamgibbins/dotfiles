runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
colorscheme molokai

set noshowmode

let g:lightline =
  \ {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [
  \       [ 'mode', 'paste' ],
  \       [ 'fugitive', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component_function': {
  \     'fugitive': 'LightLineFugitive'
  \   }
  \ }

func LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''  
endfunc
