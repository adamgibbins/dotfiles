" Vim script that turns Vim into a personal wiki
" Maintainer:	Daniel Choi <dhchoi@gmail.com>
" License: MIT License (c) 2011 Daniel Choi

if exists("g:SoyWikiStarterLoaded") || &cp || version < 700
  finish
endif
let g:SoyWikiStarterLoaded = 1


func! Soywiki()
  source /var/lib/gems/1.8/gems/soywiki-0.7.2/lib/soywiki.vim
endfunc

command! -bar -nargs=0 Soywiki :call Soywiki()

