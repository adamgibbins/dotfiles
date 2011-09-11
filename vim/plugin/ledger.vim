" File Name: ledger.vim
" Maintainer: Felix Hanley
" Created: 2011-05-15
" Updated: 2011-05-15
" Description: Ledger indentation file for vim

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1 

setlocal indentexpr=LedgerIndent()

if exists("*LedgerIndent")
    finish
endif


function LedgerIndent()
    let lnum = prevnonblank(v:lnum - 1)
    let ind = 0 
    if lnum == 0
        return 0
    endif
    if indent(lnum) != 0 && getline(v:lnum - 1) !~ '^$'
        return -1
    endif
    if getline(lnum) =~ '^[^\d]\S\+'
        let ind = ind + &sw 
    endif
    return ind 
endfunction
