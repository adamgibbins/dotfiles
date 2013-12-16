" With thanks to all those I've borrowed stuff from.
" Credits include but not limited to Martin Grenfell and Steve Losh.

" Preamble {{{
set nocompatible
autocmd!
filetype off
" }}}

" Setup {{{
" Create various directories, else vim will error due to various swap dirs etc
" missing.
if !isdirectory(expand("~/.vim_runtime"))
  !mkdir ~/.vim_runtime
endif
if !isdirectory(expand("~/.vim_runtime/undodir"))
  !mkdir ~/.vim_runtime/undodir
endif
if !isdirectory(expand("~/.vim_runtime/swapdir"))
  !mkdir ~/.vim_runtime/swapdir
endif
if !isdirectory(expand("~/.vim_runtime/backupdir"))
  !mkdir ~/.vim_runtime/backupdir
endif
" }}}

" Vundle {{{
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'airblade/vim-gitgutter'
Bundle 'anzaika/go.vim'
Bundle 'beyondwords/vim-twig'
Bundle 'chrisbra/NrrwRgn'
Bundle 'cwoac/nvim'
Bundle 'garbas/vim-snipmate'
Bundle 'gmarik/vundle'
Bundle 'gnupg.vim'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'honza/vim-snippets'
Bundle 'hsitz/VimOrganizer'
Bundle 'iptables'
Bundle 'itchyny/lightline.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ledger/vim-ledger'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mrtazz/simplenote.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'openssl.vim'
Bundle 'oscarh/vimerl'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rking/ag.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'sjl/badwolf'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/vitality.vim'
Bundle 'skwp/vim-ruby-conque'
Bundle 'spolu/dwm.vim'
Bundle 'tmatilai/gitolite.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'troydm/easybuffer.vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'VimClojure'
Bundle 'vimoutliner/vimoutliner'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'YankRing.vim'
Bundle 'ZoomWin'
" Colors {{{
Bundle 'altercation/vim-colors-solarized'
Bundle 'MaxSt/FlatColor'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tir_black'
Bundle 'tomasr/molokai'
" }}}
" }}}

" General Settings {{{
filetype on
filetype plugin indent on
set ttyfast                        " I'm using a fast terminal, its not the 90s
set shortmess=atToOI               " Short error messages
set cursorline                     " Highlight the current line
set modelines=1                    " Check 1 line for mode lines
set backspace=indent,eol,start     " More powerful/smarter backspacing
set history=500                    " High history, default is stupidly small
set ruler                          " Show line position
set showmode
set showcmd                        " Show partial command in status line
set showmatch                      " Highlight matching brackets
set matchtime=3                    " Amount of time to show matching brackets
set noerrorbells                   " Get rid of the horrible dings and flashings
set showtabline=1                  " Show tab bar at the top if >1 tab
set nobackup
set nowritebackup
if has("persistant_undo")
  set undodir=~/.vim_runtime/undodir " Persistent backup between Vim sessions
  set undofile
endif
set spelllang=en_gb                " Language to use for spell check dictionary
set scrolloff=5                    " Keep at last 5 lines above/below when scrolling
set sidescroll=1                   " Minimum number of columns to scroll sideways
set sidescrolloff=5                " Keep at least 5 lines each side when scrolling
set expandtab                      " Expand tabs into spaces
set shiftwidth=2                   " Number of spaces to use for indents
set shiftround                     " Round to multiple of 'shiftwidth'
set tabstop=2                      " Number of spaces a tab is equivilent to
set softtabstop=2
set smarttab
set autoindent
set nosmartindent                  " Disable as cindent is more reliable
set cindent                        " Auto indent according to C indentation rules
set listchars=tab:>\ ,eol:<        " Chars shown when invisible chars are turned on
set showbreak=↪                    " Character to show when lines have been wrapped
set fillchars=diff:⣿               " Character to show in diffs for deleted lines
set diffopt+=iwhite                " Ignore whitespace in diffs
set cpoptions+=J                   " Two spaces should follow sentences, not one
set splitbelow                     " Put split windows below the current one
set splitright                     " Put split windows to the right of the current
set notimeout                      " Do not timeout waiting for key combinations, wait forever
set nottimeout
set autowrite                      " Auto save when running :next and other commands
set autoread                       " Auto re-read files if they've been externally modified
set title                          " Modify window title to match vim filename
set laststatus=2                   " Always show status line
set hidden                         " Sane buffer management
if version >= 703
  set colorcolumn=121              " Display a vertical line on line 121
endif
set virtualedit+=block             " Ability to move *anywhere* while in visual mode
set directory=~/.vim_runtime/swapdir   " Write swap files to a central location
set backupdir=~/.vim_runtime/backupdir " Write backup files to a central location
set formatoptions+=tcqn
set report=0                      " Always prompt for changes
set undolevels=1000               " Max number of changes that can be undone

" Suffixes that get lower priority when using tab completion on file names.
set suffixes=.bak,~,.swp,.o,.info,.aux,.dvi,.bbl,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" }}}

" Syntax and Colouring {{{
syntax on
set background=dark
set t_Co=256                       " More than 8 colours
colorscheme molokai
let g:solarized_contrast="high"
let g:solarized_visibility="high"
" }}}

" Searching {{{
set ignorecase
set smartcase
set nohlsearch
set incsearch
set wrapscan                       " Search past the end of the file
" }}}

" Folding {{{
set foldlevel=0
set foldcolumn=1                   " Show folds on the left hand side column
set foldmethod=marker              " Fold where markers are placed
" }}}

" Encoding {{{
set encoding=utf-8                 " Text is UTF-8
set fileencoding=utf-8             " File is UTF-8
set termencoding=utf-8             " Terminal is UTF-8
set fileformats=unix,dos,mac       " Prefer Unix line endings
" }}}

" Wild Completion {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX Rubbish
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=doc
" }}}

" GUI {{{
if has('gui_running')
  set guioptions-=T                " No toolbar
  set guioptions-=m                " No menu
  set guioptions-=r                " No right scrollbar
  set guioptions-=L                " No left scrollbar
  set guicursor+=a:blinkon0        " Stop annoying blinking cursor
  if has('mac')                    " GUI Font
    set gfn=Monaco\ 8
  else
    set gfn=Inconsolata\ 8
  endif
endif
" }}}

" Key Bindings {{{
let mapleader=","
let maplocalleader=","

" Shortcut to turn spell check on and off
map <leader>ss :setlocal spell!<cr>

" Map keys so Ctrl-W isn't required to move around windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map handy tab keys
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Show invisible characters
nmap <silent> <F5> :set list!<CR>

" Toggle highlight search
nmap <silent> ,h :set invhls<CR>:set hls?<CR>

" Write using sudo
cmap w!! w !sudo tee % >/dev/null

" Saves holding shift all the time
nnoremap ; :

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &nu == 1
    set rnu
  else
    set nu
  endif
endfunction
nnoremap <leader>l :call g:ToggleNuMode()<cr>
" }}}

" Do not auto load sessions, this gets annoying
let g:session_autoload = 'no'

" Auto remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Make the directory that contains the file in the current buffer.
" Useful for editing files in a not-yet existent directory.
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Remember vim status on exit
set viminfo='50,\"1000,:100,n~/.viminfo

" Open file at last opened place
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Gundo {{{
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom=1    " Show diff under main buffer instead of just the tree
" }}}

" NERDTree {{{
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2         " Change working directory as we navigate with nerdtree
let NERDTreeShowBookmarks=1     " Show bookmarks
" }}}

" Indent Guides {{{
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <Leader>ig :IndentGuidesToggle<CR>
" }}}

" CtrlP {{{
" Remap CtrlP as it clashes with YankRing
let g:ctrlp_map = '<leader>,'
let g:ctrlp_max_height = 30
" Do not retain cache between sessions
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_extensions = ['tag']
" Do not make searches case sensitive
let g:ctrlp_mruf_case_sensitive = 0
" }}}

" MiniBufExplorer {{{
let g:miniBufExplMapWindowNavVim = 1     " Navigate windows using Ctrl+direction (hjkl)
let g:miniBufExplMapWindowNavArrows = 1  " Navigate windows using Ctrl+Arrows
let g:miniBufExplMapCTabSwitchBufs = 1   " Switch buffers with CTRL-Tab
let g:miniBufExplUseSingleClick = 1      " Switch buffer with a single click instead of double
let g:miniBufExplCloseOnSelect = 1       " Close once a buffer has been selected
let g:miniBufExplForceSyntaxEnable = 1   " Work around vim bug that turns highlighting off
" }}}

" Ledger {{{
let g:ledger_maxwidth = 80        " Max width of fold columns
let g:ledger_fillstring = '»'     " Padding for the fold columns
" }}}

" YankRing {{{
nnoremap <F11> :YRShow<CR>
let g:yankring_min_element_length = 2         " Do not retain single letter deletes
let g:yankring_max_element_length = 524288    " 0.5M max
let g:yankring_history_dir = '~/.vim_runtime' " Don't put the history in $HOME
" }}}

" Conque {{{
let g:ConqueTerm_Color=1       " Use colours for the most recent 200 lines
let g:ConqueTerm_TERM='xterm'  " Use xterm instead of vt100
" }}}

" Syntastic {{{
let g:syntastic_enable_signs=1     " Make errors more visible
let g:syntastic_auto_jump=0        " Auto jump to errors on save/open
let g:syntastic_auto_loc_list=1    " Open an error console when an error is detected
let g:syntastic_quiet_warnings=0   " Show warnings also
" }}}

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? ''.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
" }}}

" VimOrganizer {{{
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
" }}}

" EasyMotion {{{
" Remap to <leader> else it clashes with CtrlP
let g:EasyMotion_leader_key = '<Leader>'
" }}}

" gist-vim {{{
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
" }}}

" neocompletion {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Fuzzy completion
let g:neocomplcache_enable_fuzzy_completion = 1
" }}}
