set nocompatible              " vim not vi
syntax on                     " Syntax highlighting
set background=dark           " Dark background
filetype plugin indent on     " Detect file type
set history=500               " Keep X lines in history
set number                    " Show line numbers
set ruler                     " Show cursor position
set ignorecase                " Case insensitive searching
set hlsearch                  " Highlight matches
set incsearch                 " Highlight matches as you type
set showmatch                 " Show matching brackets
set fileformats=unix,dos,mac  " Order of file formats
set nobackup                  " No backups
set nowritebackup             " No backups
set wildmenu                  " Command line completion
set expandtab                 " Turn tabs into spaces
set shiftwidth=2
set tabstop=2
set smarttab

if has("autocmd")
  filetype plugin indent on
else
  set autoindent
endif

set smartindent
set visualbell " No beeps

map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" remap : to ; so no need to press shift to enter command mode
nore ; :
nore , ;

" Omni Completion
setlocal omnifunc=syntaxcomplete#Complete

" Highlight trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Status bar
set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [%04l,%04v][%p%%]\ [%L\ lines]
set laststatus=2

" Spelling
set spelllang=en_gb
map <leader>ss :setlocal spell!<cr>

" Templates
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
