" Vim syntax file
" Language:   Cotowali
" Maintainer: zakuro <z@kuro.red>
" License:    GPL-3.0-or-later


if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================= BEGIN =========================

" statements / keywords
" ---------------------
syn keyword cotowaliDeclType    struct
syn keyword cotowaliDeclaration var
hi def link cotowaliDeclType    Keyword
hi def link cotowaliDeclaration Keyword

syn keyword cotowaliConditional if else
syn keyword cotowaliRepeat      for while
hi def link cotowaliConditional Conditional
hi def link cotowaliRepeat      Repeat

syn keyword cotowaliStatement   assert break continue require return yield
syn keyword cotowaliKeyword     fn in
hi def link cotowaliStatement   Statement
hi def link cotowaliKeyword     Keyword

" types
" -----
syn keyword cotowaliType map string bool int float any void
hi def link cotowaliType Type

" function / value
" ----------------
syn keyword cotowaliBoolean true false
hi def link cotowaliBoolean Boolean

syn keyword cotowaliBuiltinFunction echo read
hi def link cotowaliBuiltinFunction Function

" number
" ------
syn match   cotowaliDecimalInt '\<\d\+\>'
hi def link cotowaliDecimalInt Integer

syn match   cotowaliFloat '\<\(\d|\.\)\+\>'
hi def link cotowaliFloat Float

hi def link Integer Number
hi def link Float   Number

" string
" ------
" TODO: escape, interpolation
syn region  cotowaliString start=+"+ skip=+\\\\\|\\'+ end=+"+
syn region  cotowaliString start=+'+ skip=+\\\\\|\\'+ end=+'+
hi def link cotowaliString String

" operator
" --------
syn match   cotowaliOperator display '\%(+\|-\|*\|/\|%\|=\|!\|>\|<\)=\?'
syn match   cotowaliOperator display '|>\|||\|&&'
hi def link cotowaliOperator Operator

" regions
" -------
syn region cotowaliBlock start='{' end='}' transparent fold
syn region cotowaliParen start='(' end=')' transparent

" comments
syn keyword cotowaliTodo contained TODO FIXME XXX BUG
hi def link cotowaliTodo Todo

syn cluster cotowaliCommentGroup contains=cotowaliTodo
syn region  cotowaliComment      start='/\*' end='\*/' contains=cotowariCommentGroup,@Spell
syn region  cotowaliComment      start='//' end='$' contains=cotowariCommentGroup,@Spell
hi def link cotowaliComment      Comment


" =========================  END  =========================

let b:current_syntax = 'cotowali'

let &cpo = s:cpo_save
unlet s:cpo_save
