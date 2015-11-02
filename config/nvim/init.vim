runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

source /usr/local/Cellar/fzf/0.10.8/plugin/fzf.vim

syntax on
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
colorscheme molokai

set noshowmode " Lightline includes the mode, stop the duplicate info
set spelllang=en_gb
set colorcolumn=121
set shortmess=atTI

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac

set expandtab
set shiftwidth=2
set shiftround
set tabstop=2
set softtabstop=2

set directory=~/.config/nvim/swap
set backupdir=~/.config/nvim/backup

let mapleader=','
let maplocalleader=','
map <leader>ss :setlocal spell!<cr>
map <leader>, :FZF<cr>

autocmd! BufWritePost * Neomake

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
