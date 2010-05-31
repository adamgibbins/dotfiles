syntax on
set background=dark
set history=500
set number
set ignorecase
set hlsearch
set showmatch
set fileformats=unix,dos,mac
set nobackup
set nowritebackup
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set autoindent
set smartindent
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" remap : to ; so no need to press shift to enter command mode
nore ; :
nore , ;

" Omni Completion
setlocal omnifunc=syntaxcomplete#Complete

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
