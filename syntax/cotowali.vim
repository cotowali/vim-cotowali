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
syn keyword cotowaliDeclaration var const
hi def link cotowaliDeclType    Keyword
hi def link cotowaliDeclaration Keyword

syn keyword cotowaliConditional if else
syn keyword cotowaliRepeat      for while
hi def link cotowaliConditional Conditional
hi def link cotowaliRepeat      Repeat

syn keyword cotowaliStatement   assert break continue require return yield
syn keyword cotowaliKeyword     fn in type module
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

syn keyword cotowaliBuiltinFunction echo read typeof nameof
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
syn match   cotowaliStringVarExpansion     '\$\w*'    display contained
syn region  cotowaliStringExprSubstitution start=+${+ end=+}+ contained contains=@cotowaliStringExprContained
hi def link cotowaliStringVarExpansion     Special
hi def link cotowaliStringExprSubstitution Special

syn cluster cotowaliStringExprContained contains=
  \ cotowaliBoolean,cotowaliDecimalInt,cotowaliFloat,cotowaliString,cotowaliRawString,
  \ cotowaliOperator,cotowaliParen,cotowaliBlockComment

syn match   cotowaliDoubleQuotedStringEscapeSequence /\v\\([nt\"$]|[xX][0-9a-fA-F]{0,2})/ display contained containedin=cotowaliDoubleQuotedString
syn match   cotowaliSingleQuotedStringEscapeSequence '\\[\']' display contained containedin=cotowaliSingleQuotedString
hi def link cotowaliDoubleQuotedStringEscapeSequence cotowaliEscapeSequence
hi def link cotowaliSingleQuotedStringEscapeSequence cotowaliEscapeSequence
hi def link cotowaliEscapeSequence Special

syn region  cotowaliString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=
  \ cotowaliDoubleQuotedStringEscapeSequence,cotowaliStringVarExpansion,cotowaliStringExprSubstitution
syn region  cotowaliString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cotowaliSingleQuotedStringEscapeSequence
hi def link cotowaliString String

syn region  cotowaliRawString start=+r"+ end=+"+
syn region  cotowaliRawString start=+r'+ end=+'+
hi def link cotowaliRawString String

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
" --------
syn keyword cotowaliTodo contained TODO FIXME XXX BUG
hi def link cotowaliTodo Todo

syn cluster cotowaliCommentGroup  contains=cotowaliTodo
syn region  cotowaliBlockComment  start='/\*' end='\*/' contains=cotowaliBlockComment,cotowariCommentGroup,@Spell
syn region  cotowaliInlineComment start='//' end='$' contains=cotowariCommentGroup,@Spell
hi def link cotowaliBlockComment  Comment
hi def link cotowaliInlineComment Comment

" inline shell
syn region cotowaliInlineBlock start='inline\_s*{' end='}'

if exists('b:current_syntax')
  unlet b:current_syntax
endif

syn region cotowaliShBlock start='sh\_s*{\@=' end='}\@<=' contains=@cotowaliInlineSh
syn include @cotowaliInlineSh syntax/sh.vim

if exists('b:current_syntax')
  unlet b:current_syntax
endif

syn region cotowaliPwshBlock start='pwsh\_s{' end='}\@<=' contains=@cotowaliInlinePwsh
try
  syn include @cotowaliInlinePwsh syntax/ps1.vim
  syn cluster Block remove=ps1Block
catch
endtry

if exists('b:current_syntax')
  unlet b:current_syntax
endif

" =========================  END  =========================

let b:current_syntax = 'cotowali'

let &cpo = s:cpo_save
unlet s:cpo_save
