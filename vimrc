set nocompatible " Is first as this alters other vim behaviour
autocmd!
filetype off     " Need to turn off before running pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Detect filetype
filetype plugin indent on

" Syntax
syntax on
set background=dark
set t_Co=245 " More than 8 colours

" Misc
set history=500
set number
set ruler
set showmatch     " Highlight matching brackets
set fileformats=unix,dos,mac
let mapleader=","
set textwidth=78  " Wrap comments
set noerrorbells
set showtabline=2 " Always show tabs at the top
set encoding=utf8
set termencoding=utf8

" Searching
set ignorecase " Case insensitive
set smartcase  " Case sensitive if search string contains capital letters
set hlsearch   " Highlight matches
set incsearch  " Highlight matches as you type

" Backups
set nobackup
set nowritebackup

" Indentation
set expandtab " Tabs to spaces
set shiftwidth=2
set tabstop=2
set smarttab
set smartindent

" Spelling
set spelllang=en_gb
map <leader>ss :setlocal spell!<cr>
