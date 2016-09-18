runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

source /usr/local/opt/fzf/plugin/fzf.vim

syntax on
filetype plugin indent on

set termguicolors
set t_Co=256
colorscheme lucius
set bg=dark
LuciusBlackHighContrast

set noshowmode " Lightline includes the mode, stop the duplicate info
set spelllang=en_gb
set colorcolumn=121
set shortmess+=atTI
set scrolloff=5 " Keep 5 lines above/below when scrolling
set sidescrolloff=5 " Keep 5 lines left/right when scrolling
set showbreak=↪
set updatetime=1000 " Makes gitgutter update quicker
set formatoptions+=tcqnj
set hidden
set shada+='50
set mouse=r
set updatecount=50

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac

set expandtab
set shiftwidth=2
set shiftround
set tabstop=2
set softtabstop=2

set ignorecase " Ignore case when searching
set smartcase  " Don't ignore case when searching, if upper-case chars are used

set directory=~/.config/nvim/swap
set backupdir=~/.config/nvim/backup

set undodir=~/.config/nvim/undo
set undofile
set undolevels=5000

let mapleader=','
let maplocalleader=','
map <leader>ss :setlocal spell!<cr>
map <leader>, :FZF<cr>
map <leader>tt :Tags<cr>
map <leader>tn :tabnew<cr>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

let g:ledger_bin = '~/doc/ledger/bin/ledger'
let g:ledger_default_commodity = '£'
let g:ledger_fillstring = '  —'
let g:ledger_maxwidth = 80
let g:ledger_align_at = 60
au FileType ledger map <leader>x :call ledger#transaction_state_toggle(line('.'), ' *!')<cr>

let g:task_rc_override = 'rc._forcecolor=no rc.defaultwidth=120'
let g:task_default_prompt = ['description', 'project', 'energy', 'priority', 'due', 'tags']

autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

let g:lightline =
  \ {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [
  \       [ 'mode', 'paste', 'warning' ],
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

let g:vimwiki_list = [{'path': '~/doc/scraps', 'path_html': '~/Public/scraps', 'ext': '.txt'}]
let taskwiki_data_location = "~/doc/taskwarrior"
let b:beancount_root = "~/doc/beancount"
let g:deoplete#enable_at_startup = 1
