" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="mytheme"
let g:rehash256 = 1

" let c_black=233
" let c_verydarkgray=239
" let c_darkgray=244
" let c_lightgray=252
" let c_orange=208
" let c_purple=141
" let c_blue=111
" let c_green=150
" let c_yellow=222
" let c_red=203
" let c_pink=170
" let c_white=255

if has("spell")
hi SpellBad ctermbg=52
hi SpellCap ctermbg=17
hi SpellLocal ctermbg=17
hi SpellRare ctermbg=none ctermfg=none cterm=reverse
endif


hi ColorColumn    ctermbg=236
hi Comment        ctermfg=244
hi Constant       ctermfg=141               cterm=none
hi Cursor         ctermfg=16   ctermbg=253
hi CursorColumn   ctermbg=236
hi CursorLine     ctermbg=236               cterm=none
hi CursorLineNr   ctermfg=208               cterm=none
hi Debug          ctermfg=225               cterm=bold
hi DiffAdd        ctermfg=2    ctermbg=235
hi DiffChange     ctermfg=252  ctermbg=235
hi DiffDelete     ctermfg=1    ctermbg=235
hi DiffText       ctermfg=3    ctermbg=235  cterm=bold
hi Directory      ctermfg=84                cterm=bold
hi Error          ctermfg=222  ctermbg=233
hi ErrorMsg       ctermfg=199  ctermbg=16   cterm=bold
hi Exception      ctermfg=150               cterm=bold
hi FoldColumn     ctermfg=67   ctermbg=16
hi Folded         ctermfg=67   ctermbg=16
hi Function       ctermfg=150
hi Identifier     ctermfg=208               cterm=none
hi Ignore         ctermfg=244  ctermbg=232
hi IncSearch      ctermfg=193  ctermbg=16
hi Keyword        ctermfg=203               cterm=bold
hi Label          ctermfg=229               cterm=none
hi LineNr         ctermfg=239  ctermbg=235
hi Macro          ctermfg=193
hi MatchParen     ctermfg=233  ctermbg=208  cterm=none
hi ModeMsg        ctermfg=229
hi MoreMsg        ctermfg=229
hi NonText        ctermfg=239
hi Normal         ctermfg=252  ctermbg=234
"hi Operator       ctermfg=203
hi Pmenu          ctermfg=111  ctermbg=16
hi PmenuSbar      ctermbg=232
hi PmenuSel       ctermfg=255  ctermbg=242
hi PmenuThumb     ctermfg=111
hi Question       ctermfg=111
hi Search         ctermfg=0    ctermbg=111  cterm=NONE
hi SignColumn     ctermfg=84   ctermbg=235
hi Special        ctermfg=111
hi SpecialChar    ctermfg=203               cterm=none
hi SpecialComment ctermfg=245               cterm=bold
hi SpecialKey     ctermfg=239
hi Statement      ctermfg=150
hi StatusLine     ctermfg=238  ctermbg=253
hi StatusLineNC   ctermfg=244  ctermbg=232
hi StorageClass   ctermfg=208               cterm=none
hi String         ctermfg=222
" hi TabLine
" hi TabLineFill
hi Tag            ctermfg=203
hi Title          ctermfg=208               cterm=none
hi Todo           ctermfg=231  ctermbg=232  cterm=bold
hi Type           ctermfg=111               cterm=none
hi Underlined     ctermfg=244               cterm=underline
hi VertSplit      ctermfg=244  ctermbg=232  cterm=bold
hi Visual         ctermbg=238
hi VisualNOS      ctermbg=238
hi WarningMsg     ctermfg=231  ctermbg=238  cterm=bold
hi WildMenu       ctermfg=111  ctermbg=16
"hi Cursor
hi keyword        ctermfg=203               cterm=none

"general
hi link Operator        Normal
hi link Boolean         Constant
hi link Character       String
hi link Conditional     Keyword
hi link Define          Type
hi link Delimiter       Operator
hi link Float           Constant
hi link SpecialFunction Function
hi link Number          Constant
hi link PreCondit       Conditional
hi link PreProc         Identifier
hi link Repeat          Keyword
hi link Structure       Type
hi link Typedef         Type

"bash script
hi link bashSpecialVariables Identifier

"shell script
hi link shVariable      Identifier
hi link shDerefVar      Identifier
hi link shDerefSimple   Identifier
hi link shCmdSubRegion  Operator
hi link shStatement     Statement
hi link shArithRegion   Operator
hi link shConditional   Conditional
hi link shSnglCase      Operator
hi link shSetIdentifier Operator
hi link shQuote         String

"php
hi link phpInclude      Function
hi link phpSpecialFunction phpFunctions
hi link phpComparison   Operator
hi link phpVarSelector  Identifier

"perl
hi link perlBraces      Keyword

"vim
hi link vimOption       Identifier
hi link vimHiGroup      Identifier
hi link vimGroup        Identifier
hi link vimFgBgAttrib   Constant
hi link vimHiAttrib     Constant
hi link vimCommentTitle Comment
hi link vimSetEqual     Operator

"mysql
hi link mysqlString     String
hi link mysqlSpecial    mysqlString
hi link mysqlNumber     mysqlString

set background=dark
