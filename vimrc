" With thanks to all those I've borrowed stuff from.
" Credits include but not limited to Martin Grenfell and Steve Losh.

" Preamble {{{
set nocompatible
autocmd!
filetype off
" }}}

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
Bundle 'gnupg.vim'
Bundle 'anzaika/go.vim'
Bundle 'godlygeek/tabular'
Bundle 'honza/snipmate-snippets'
Bundle 'lunaru/vim-less'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mrtazz/molokai.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
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
Bundle 'YankRing.vim'
Bundle 'scrooloose/syntastic'
Bundle 'rson/vim-conque'
" }}}

" General Settings {{{
filetype on
filetype plugin indent on
set ttyfast                        " I'm using a fast terminal, its not the 90s
set shortmess=at                   " Short error messages
set cursorline                     " Highlight the current line
set textwidth=80                   " Max line width before auto wrapping.
set modelines=1                    " Check 1 line for mode lines
set backspace=indent,eol,start     " Move powerful/smarter backspacing
set history=500                    " High history, default is stupidly small
set relativenumber                 " Show relative line numbers
set ruler                          " Show line position
set showmode
set showcmd                        " Show partial command in status line
set showmatch                      " Highlight matching brackets
set matchtime=3                    " Amount of time to show matching brackets
set noerrorbells                   " Get rid of the horrible dings and flashings
set showtabline=1                  " Show tab bar at the top if >1 tab
set nobackup
set nowritebackup
set undodir=~/.vim_runtime/undodir " Persistent backup between Vim sessions
set undofile
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
set notimeout
set nottimeout
set autowrite
set autoread                       " Auto re-read files if they've been externally modified
set title
" TODO Turn this back on once the colour is configured - it defaults to bright
" red - which is very distracting.
"set colorcolumn=+1                " Draw a line at textwidth+1
set virtualedit+=block             " Ability to move *anywhere* while in visual mode

" Suffixes that get lower priority when using tab completion on file names.
set suffixes=.bak,~,.swp,.o,.info,.aux,.dvi,.bbl,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" }}}

" Syntax and Colouring {{{
syntax on
set background=dark
set t_Co=256                       " More than 8 colours
colorscheme molokai
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
" }}}

" GUI {{{
if has('gui_running')
  set guioptions-=T                " No toolbar
  set guioptions-=m                " No menu
  set guioptions-=r                " No scrollbar
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
" }}}

" Auto remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Make the directory that contains the file in the current buffer.
" Useful for editing files in a not-yet existent directory.
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Remember vim status on exit
set viminfo='50,\"1000,:100,n~/.viminfo

" Taglist {{{
nnoremap <F8> :TlistToggle<CR>
let Tlist_Auto_Update = 0                " Auto update tags
let Tlist_Exit_OnlyWindow = 1            " Exit vim if taglist is the only win open
" }}}

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

" Command-T
let g:CommandTMaxHeight=30

" MiniBufExplorer {{{
let g:miniBufExplMapWindowNavVim = 1     " Navigate windows using Ctrl+direction (hjkl)
let g:miniBufExplMapWindowNavArrows = 1  " Navigate windows using Ctrl+Arrows
let g:miniBufExplMapCTabSwitchBufs = 1   " Switch buffers with CTRL-Tab
let g:miniBufExplUseSingleClick = 1      " Switch buffer with a single click instead of double
let g:miniBufExplCloseOnSelect = 1       " Close once a buffer has been selected
" Turned this off as it causes vim to flicker on every write and other common occurances.
"let g:miniBufExplForceSyntaxEnable = 1   " Work around vim bug that turns highlighting off
" }}}

" Ledger {{{
let g:ledger_maxwidth = 80        " Max width of fold columns
let g:ledger_fillstring = '»'     " Padding for the fold columns
" }}}

" Status line {{{
set statusline=%f "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning() " {{{
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction " }}}

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight() " {{{
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction " }}}

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning() " {{{
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

"find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction " }}}

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning() " {{{
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

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
endfunction " }}}

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines() " {{{
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
endfunction " }}}

"find the median of the given array of numbers
function! s:Median(nums) " {{{
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction " }}}
" }}}
