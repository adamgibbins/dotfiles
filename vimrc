" Need this first as it alters vim behaviour
set nocompatible
autocmd!
" Need to turn this off prior to running pathogen
filetype off

" Vundle {{{
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'cypok/vim-ledger'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'gmarik/vundle'
Bundle 'gnupg'
Bundle 'go.vim'
Bundle 'godlygeek/tabular'
Bundle 'honza/snipmate-snippets'
Bundle 'lunaru/vim-less'
Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'tir_black'
Bundle 'tmatilai/gitolite.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'vimoutliner/vimoutliner'
Bundle 'wincent/Command-T'
Bundle 'xolox/vim-session'
" }}}

" General Settings {{{
filetype on
filetype plugin indent on
set shortmess=at                      " Short error messages
set cursorline                        " Highlight the current line
syntax on
set background=dark
set t_Co=256                          " More than 8 colours
colorscheme tir_black
set textwidth=80                      " Max line width before auto wrapping.
set modelines=1                       " Check 1 line for mode lines
set wildmenu
set wildmode=longest,full,list
set backspace=indent,eol,start        " Move powerful/smarter backspacing
set history=500                       " High history, default is stupidly small
set relativenumber                    " Show relative line numbers
set ruler                             " Show line position
set showcmd                           " Show partial command in status line
set showmatch                         " Highlight matching brackets
set fileformats=unix,dos,mac          " Prefer Unix line endings
set noerrorbells                      " Get rid of the horrible dings and flashings
set showtabline=1                     " Show tab bar at the top if >1 tab
set encoding=utf8
set termencoding=utf8
set nobackup
set nowritebackup
set undodir=~/.vim_runtime/undodir    " Persistent backup between Vim sessions
set undofile
set spelllang=en_gb                   " Language to use for spell check dictionary
set scrolloff=5                       " Keep at last 5 lines above/below when scrolling
set sidescrolloff=5                   " Keep at least 5 lines each side when scrolling
set foldcolumn=1                      " Show folds on the left hand side column
set foldmethod=marker                 " Fold where markers are placed
set ignorecase
set smartcase
set nohlsearch
set incsearch
set expandtab                         " Expand tabs into spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent
set nosmartindent                     " Disable as cindent is more reliable
set cindent                           " Auto indent according to C identation rules

" Suffixes that get lower priority when tab using tab completion on file names.
set suffixes=.bak,~,.swp,.o,.info,.aux,.dvi,.bbl,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" }}}

" GUI {{{
if has('gui_running')
  set guioptions-=T                     " No toolbar
  set guioptions-=                      " No menu
  set guioptions-=r                     " No scrollbar
  set guicursor+=a:blinkon0             " Stop annoying blinking cursor
  set gfn=Monaco\ 8                     " GUI Font
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
" }}}

" Auto remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Make the directory that contains the file in the current buffer.
" Useful for editing files in a not-yet existant directory.
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Vim wiki
let g:vimwiki_list = [{ 'path': '~/Dropbox/vimwiki/', 'path_html': '~/www/vimwiki/public/', 'auto_export': 1 }]

" Remember vim status on exit
set viminfo='50,\"1000,:100,n~/.viminfo

" Indent Guides - ,ig to trigger
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Command-T
let g:CommandTMaxHeight=30
set wildignore+=*.o,*.obj,.git,*.pyc

"statusline setup
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

" display current git branch
set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%#warningmsg#
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        " Always show status line

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
