if exists("b:current_syntax")
    finish
endif

syn keyword natureKeyword new
syn keyword natureKeyword type fn
syn keyword natureKeyword as in is
syn keyword natureKeyword var const
syn keyword natureKeyword interface enum union
syn keyword natureInclude import export include
syn keyword natureException throw catch
"syn keyword natureSuper   private

"syn keyword natureLabel case 
syn keyword natureRepeat for while loop
syn keyword natureStatement break continue return
syn keyword natureConditional if else match

syn keyword natureType bool void string anyptr any ptr rawptr
syn keyword natureType i8 i16 i32 i64 u8 u16 u32 u64 int uint
syn keyword natureType float f32 f64
syn keyword natureThis self
syn keyword ModeMsg null
syn keyword Added true 
syn keyword Title false

syn match PreProc        '[@]'
syn match natureSymbol   '[,;]'
syn match Operator       '[\+\-\%=\/\^\&\*!?><\$|]'
syn match SpecialComment '[`:\.#]'
syn match Constant       '[{}\[\]()]'
syn match natureType     '\v(\.@1<!|\.\.)\zs<([iu][0-9]{1,3})?>' display
syn match natureType     '\w\+_t\(\W\|$\)\@='
syn match natureTypedef  '\s\w\+\(\.\w\+.*(.*).*{\s*\(.*}\)\?$\)\@='
hi def natureSymbol ctermfg=DarkGray guifg=DarkGray

hi def link natureFunc Function
hi def link natureTypedef Changed
"hi def natureType ctermfg=DarkCyan guifg=DarkCyan
hi def link natureType MoreMsg
"hi def natureThis ctermfg=DarkMagenta guifg=DarkMagenta
hi def link natureThis Label

syn match Repeat   "\([^\.]\.\)\@<=\w\w*\(\(\[.*\]\)*\s*(\)\@!"
syn match natureType '\(:\s*\)\@<=\w\w*\(\(\(\(\[.*\]\)\|\({.*}\)\|\(\w\+\)\|\(\*\|?\|!\)\)\s*\)*\)\@='

syn match natureType    "\v\w+\ze\<.*\>" "foo<T>();
"syn match natureType    "\w\(\w\)*<"he=e-1,me=e-1 " foo<T>();
"syn match natureType    "\(->\s*\)\@<=\w\(\w\)*"
syn match natureFunc    "[0-9a-zA-Z_@]*\w\w*\(\(<.*>\s*\)*\(\[.*\]\)*\s*(\)\@="

syn match  natureSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  natureSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  natureCharacter        "'[^']*'" contains=natureSpecialChar,natureSpecialCharError
syn match  natureCharacter        "'\\''" contains=natureSpecialChar
syn match  natureCharacter        "'[^\\]'"
syn region natureString           start=+["'`]+ end=+["'`]+ end=+$+ contains=natureSpecialChar,natureSpecialCharError,@Spell

syn match natureNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match natureNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match natureFloat '\v<\.?\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match natureFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?[fFdD]?>' display
syn match natureFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display
" Integer literals
syn match natureInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match natureInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display
" Escape sequences
syn match natureEscape '\\[\\'"0abfnrtv]' contained display
syn match natureEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match natureFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=natureEscape display
syn match natureFormat '{{\|}}' contained display


hi def link natureSuper                 Title
hi def link natureFloat                 Number
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
hi def link natureString                String
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
syn match   SpecialComment "^\#.*$"
syn match   Conditional '\v[@]\ze\w'

let b:current_syntax = "nature"
