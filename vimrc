""""""""""""""""
" Initial Setup {{{
""""""""""""""""
" Need this first as it alters vim behaviour
set nocompatible
autocmd!
" Need to turn this off prior to running pathogen
filetype off
" Awesome plugin management - pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Detect filetype
filetype plugin indent on
" Define map leader - needs to be near top else doesn't work correctly.
let mapleader=","
" }}}

""""""""""""""""
" Syntax {{{
""""""""""""""""
syntax on
set background=dark
set t_Co=248 " More than 8 colours
" }}}

""""""""""""""""
" Misc {{{
""""""""""""""""
" High history, default is stupidly small
set history=500
" Show line numbers
set number
" Show the line position
set ruler
" Hilight matching brackets
set showmatch
" Prefer unix file format over everything else
set fileformats=unix,dos,mac
" Wrap line insertion.
" FIXME: Make this only work on comments.
set textwidth=78
" Get rid of those horrible dings and flashes.
set noerrorbells
" Show tar bar at top if more than 1 tab.
set showtabline=1
" Always use UTF8
set encoding=utf8
set termencoding=utf8
" Do not create backups, they just clutter the filesystem.
" You're using source control anyhow right?
set nobackup
set nowritebackup
" Set dictionary for spellcheck
set spelllang=en_gb
" Toggle spelling
map <leader>ss :setlocal spell!<cr>
" }}}

""""""""""""""""
" Key Mappings {{{
""""""""""""""""
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

""""""""""""""""
" Folding {{{
""""""""""""""""
" Show folds on the left hand side column
set foldcolumn=1
" Fold where markers are placed
set foldmethod=marker
" }}}

""""""""""""""""
" Searching {{{
""""""""""""""""
" Ignore case when searching
set ignorecase
" Make search case sensitive if it contains capitals
set smartcase
" Hilight search matches
set hlsearch
" Hilight search matches as you type
set incsearch
" }}}

""""""""""""""""
" Indentation {{{
""""""""""""""""
" Expand all tabs to spaces
set expandtab
" Set tab width to 2 spaces
set shiftwidth=2
set tabstop=2
" TODO: Document
set smarttab
set smartindent
" }}}

""""""""""""""""
" Statusbar {{{ 
""""""""""""""""
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
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        " Always show status line

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

""recalculate the trailing whitespace warning when idle, and after saving
"autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

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
" }}}
