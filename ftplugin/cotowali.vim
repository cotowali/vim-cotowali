" Vim filetype plugin file
" Language:   Cotowali
" Maintainer: zakuro <z@kuro.red>
" License:    GPL-3.0-or-later

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1


let s:save_cpo = &cpo
set cpo&vim

setlocal formatoptions-=t formatoptions+=croql

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setl fo< com< cms<'

let &cpo = s:save_cpo
unlet s:save_cpo
