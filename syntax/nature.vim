if exists("b:current_syntax")
    finish
endif

syn keyword natureKeyword new
syn keyword natureKeyword type fn
syn keyword natureKeyword var const let static
syn keyword natureKeyword interface enum union
syn keyword natureException throw try catch
syn keyword natureInclude export include pub package macro alias extend
"syn keyword natureSuper   private

"syn keyword natureLabel go 
syn keyword natureRepeat for while loop in is go
syn keyword natureOperator as 
syn keyword natureStatement break continue return
syn keyword natureConditional if else match select

syn keyword natureType bool void string anyptr any ptr rawptr
syn keyword natureType i8 i16 i32 i64 u8 u16 u32 u64 int uint
syn keyword natureType float f32 f64
syn keyword natureSelf self

syn match PreProc       '[@]'
syn match natureSymbol  '[,;:\.]'
syn match Operator      '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match Constant      '[{}\[\]()]'
"syn match natureTypedef '\<\w\+\(\(<.*>\)\?\s*\.\w\+.*(.*).*{\s*\(.*}\)\?$\)\@='
syn match natureType    '\v<\w+_[tscemui]>'
syn match Macro         '\v<[_]*\u[A-Z0-9_]*>'
syn match natureType    '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match natureType    '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match Repeat        '\v([^\.](\.|::))@<=\w\w*'
syn match natureSMacro   '\v(::\s*)@<=[_]*\u\w*'
syn match natureType    '\v\w+\ze(::|\<[.*]*\>)' "foo<T>()
syn match Function      '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('
"syn match natureType    '\v(([^:]:|-\>)\s*\&*)@<=\w\w*>'

syn match Exception     '\v(\W@<=[~&*]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*]+\ze\W)'
syn match Changed       '\v((type|interface|struct|enum|union)(\<.*\>)?\s*)@<=[_]*\u\w*\ze(\<.*\>)?\s*(\(|\{)'
"syn keyword Keyword type struct enum interface nextgroup=natureTypedef skipwhite skipempty

syn match natureInclude '\v^\s*import [^*]*'
syn match natureMacro   '\v^\[.{-}\]'
syn match natureSMacro  '\v<(assert)(_\w+)?>\ze\s*\('

" -- shader
"syn keyword natureKeyword  uniform instance varying var
"syn keyword natureKeyword  vertex fragment
"syn keyword natureType     texture texture2D
syn match   natureType     '\v<bool[234]?>'
syn match   natureType     '\v<int[234]?>'
syn match   natureType     '\v<uint[234]?>'
syn match   natureType     '\v<half[234]?>'
syn match   natureType     '\v<float([234](x[234])?)?>'
syn match   natureType     '\v<[dbui]?vec[234]>'
syn match   natureType     '\v<vec[234][dbfhui]?>'
syn match   natureType     '\v<mat[234](x[234]f)?>'

hi def link natureConstant  Constant
hi def link natureTitle     Title
hi def link natureSymbol    Changed
hi def link natureMacro     Macro
hi def link natureSMacro    SpecialComment
hi def link natureFunc      Function
hi def link natureTypedef   Changed
hi def link natureType      MoreMsg
hi def link natureSelf      Label

syn match  natureSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  natureSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  natureCharacter        "'[^']*'" contains=natureSpecialChar,natureSpecialCharError
syn match  natureCharacter        "'\\''" contains=natureSpecialChar
syn match  natureCharacter        "'[^\\]'"

"syn region    natureString      matchgroup=natureString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=natureEscape,@Spell
syn region    natureString      matchgroup=natureString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    natureString      matchgroup=natureString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@Spell
syn region    natureString      matchgroup=natureString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match natureNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match natureNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match natureFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match natureFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match natureFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match natureInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match natureFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match natureFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match natureFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match natureFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match natureEscape '\\[\\'"0abfnrtv]' contained display
syn match natureEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match natureFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=natureEscape display
syn match natureFormat '{{\|}}' contained display


hi def link natureSuper                 Title
hi def link natureFloat                 Float
hi def link natureInteger               Number
hi def link natureEscape                SpecialComment
hi def link natureFormat                SpecialChar

hi def link natureKeyword               Keyword
hi def link natureInclude               Include
hi def link natureLabel                 Label
hi def link natureConditional           Conditional
hi def link natureRepeat                Repeat
hi def link natureStatement             Statement
"hi def link natureType                  Type
hi def link natureNumber                Number
hi def link natureComment               Comment
hi def link natureOperator              Operator
hi def link natureCharacter             Character
hi def link natureString                String
hi def link natureTodo                  Todo
hi def link natureSpecial               Special
hi def link natureSpecialError          Error
hi def link natureSpecialCharError      Error
hi def link natureCharacter             Character
hi def link natureSpecialChar           SpecialChar
hi def link natureException             Exception

syn match natureTypedef  contains=natureTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match natureFunc    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn keyword natureKeyword union struct enum interface type nextgroup=natureTypedef skipwhite skipempty
syn keyword natureKeyword interface nextgroup=natureType skipwhite skipempty contained
" adapted from neovim runtime/syntax
syn keyword natureTodo contained TODO FIXME XXX NOTE
syn region  natureComment start="/\*" end="\*/" contains=natureTodo,@Spell
syn match   natureComment "//.*$" contains=natureTodo,@Spell
syn match   PreProc "\#.*$"

let b:current_syntax = "nature"
