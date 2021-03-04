" -----------------------------------------------------------------------------
" Name:         tlou2
" Description:  Based on wallpaper from The Last of Us 2 
" Author:       Brandon Wright
" Website:      https://gitlab.com/branwright/non-flaked-nix/
" License:      MIT
" -----------------------------------------------------------------------------
"
"
scriptencoding utf-8

set background=dark

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='tlou2'

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette {{{

let s:black          = ['#201e1a;', 0]
let s:red            = ['#674441', 1]
let s:green          = ['#5d6051', 2]
let s:yellow         = ['#84694e', 3]
let s:blue           = ['#535c5c', 4]
let s:magenta        = ['#715e5e', 5]
let s:cyan           = ['#4d5c5c', 6]
let s:white          = ['#79695a', 7]
let s:bright_black   = ['#443a36', 8]
let s:bright_red     = ['#765754', 9]
let s:bright_green   = ['#5d6051', 10]
let s:bright_yellow  = ['#907860', 11]
let s:bright_blue    = ['#535c5c', 12]
let s:bright_magenta = ['#614c4c', 13]
let s:bright_cyan    = ['#4d5c5c', 14]
let s:bright_white   = ['#79695a', 15]

" xterm colors.
let s:orange        = ['#585c49', 202]
let s:bright_orange = ['#6d715e', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#303030', 236]
let s:xgray3        = ['#3A3A3A', 237]
let s:xgray4        = ['#444444', 238]
let s:xgray5        = ['#443a36', 239]
let s:xgray6        = ['#585858', 240]

"}}}
" Setup Variables: {{{

let s:none = ['NONE', 'NONE']

if !exists('g:tlou2_bold')
  let g:tlou2_bold=1
endif

if !exists('g:tlou2_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:tlou2_italic=1
  else
    let g:tlou2_italic=0
  endif
endif

if !exists('g:tlou2_transparent_background')
  let g:tlou2_transparent_background=0
endif

if !exists('g:tlou2_undercurl')
  let g:tlou2_undercurl=1
endif

if !exists('g:tlou2_underline')
  let g:tlou2_underline=1
endif

if !exists('g:tlou2_inverse')
  let g:tlou2_inverse=1
endif

if !exists('g:tlou2_inverse_matches')
  let g:tlou2_inverse_matches=0
endif

if !exists('g:tlou2_inverse_match_paren')
  let g:tlou2_inverse_match_paren=0
endif

if !exists('g:tlou2_dim_lisp_paren')
  let g:tlou2_dim_lisp_paren=0
endif

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:tlou2_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:tlou2_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:tlou2_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:tlou2_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:tlou2_inverse == 0
  let s:inverse = ''
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let l:fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let l:emstr = a:2
  else
    let l:emstr = 'NONE,'
  endif

  let l:histring = [ 'hi', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:emstr[:-2], 'cterm=' . l:emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(l:histring, 'guisp=' . a:3[0])
  endif

  execute join(l:histring, ' ')
endfunction
"}}}
" tlou2 Hi Groups: {{{

" memoize common hi groups
call s:HL('tlou2White', s:white)
call s:HL('tlou2Red', s:red)
call s:HL('tlou2Green', s:green)
call s:HL('tlou2Yellow', s:yellow)
call s:HL('tlou2Blue', s:blue)
call s:HL('tlou2Magenta', s:magenta)
call s:HL('tlou2Cyan', s:cyan)
call s:HL('tlou2Black', s:black)

call s:HL('tlou2RedBold', s:red, s:none, s:bold)
call s:HL('tlou2GreenBold', s:green, s:none, s:bold)
call s:HL('tlou2YellowBold', s:yellow, s:none, s:bold)
call s:HL('tlou2BlueBold', s:blue, s:none, s:bold)
call s:HL('tlou2MagentaBold', s:magenta, s:none, s:bold)
call s:HL('tlou2CyanBold', s:cyan, s:none, s:bold)

call s:HL('tlou2BrightRed', s:bright_red, s:none)
call s:HL('tlou2BrightGreen', s:bright_green, s:none)
call s:HL('tlou2BrightYellow', s:bright_yellow, s:none)
call s:HL('tlou2BrightBlue', s:bright_blue, s:none)
call s:HL('tlou2BrightMagenta', s:bright_magenta, s:none)
call s:HL('tlou2BrightCyan', s:bright_cyan, s:none)
call s:HL('tlou2BrightBlack', s:bright_black, s:none)
call s:HL('tlou2BrightWhite', s:bright_white)

" special
call s:HL('tlou2Orange', s:orange)
call s:HL('tlou2BrightOrange', s:bright_orange)
call s:HL('tlou2OrangeBold', s:orange, s:none, s:bold)
call s:HL('tlou2HardBlack', s:hard_black)
call s:HL('tlou2Xgray1', s:xgray1)
call s:HL('tlou2Xgray2', s:xgray2)
call s:HL('tlou2Xgray3', s:xgray3)
call s:HL('tlou2Xgray4', s:xgray4)
call s:HL('tlou2Xgray5', s:xgray5)
call s:HL('tlou2Xgray6', s:xgray6)

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:black[0]
  let g:terminal_color_8 = s:bright_black[0]

  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_9 = s:bright_red[0]

  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_10 = s:bright_green[0]

  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_11 = s:bright_yellow[0]

  let g:terminal_color_4 = s:blue[0]
  let g:terminal_color_12 = s:bright_blue[0]

  let g:terminal_color_5 = s:magenta[0]
  let g:terminal_color_13 = s:bright_magenta[0]

  let g:terminal_color_6 = s:cyan[0]
  let g:terminal_color_14 = s:bright_cyan[0]

  let g:terminal_color_7 = s:white[0]
  let g:terminal_color_15 = s:bright_white[0]
endif

" }}}
" Setup Terminal Colors For Vim with termguicolors: {{{

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0] = s:black[0]
  let g:terminal_ansi_colors[8] = s:bright_black[0]

  let g:terminal_ansi_colors[1] = s:red[0]
  let g:terminal_ansi_colors[9] = s:bright_red[0]

  let g:terminal_ansi_colors[2] = s:green[0]
  let g:terminal_ansi_colors[10] = s:bright_green[0]

  let g:terminal_ansi_colors[3] = s:yellow[0]
  let g:terminal_ansi_colors[11] = s:bright_yellow[0]

  let g:terminal_ansi_colors[4] = s:blue[0]
  let g:terminal_ansi_colors[12] = s:bright_blue[0]

  let g:terminal_ansi_colors[5] = s:magenta[0]
  let g:terminal_ansi_colors[13] = s:bright_magenta[0]

  let g:terminal_ansi_colors[6] = s:cyan[0]
  let g:terminal_ansi_colors[14] = s:bright_cyan[0]

  let g:terminal_ansi_colors[7] = s:white[0]
  let g:terminal_ansi_colors[15] = s:bright_white[0]
endif

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
"
if g:tlou2_transparent_background == 1 && !has('gui_running')
  call s:HL('Normal', s:bright_white, s:none)
 else
  call s:HL('Normal', s:bright_white, s:black)
endif

if v:version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:xgray2)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine


  if g:tlou2_transparent_background == 1 && !has('gui_running')
    " Tab pages line filler
    call s:HL('TabLineFill', s:green, s:none)
    " Active tab page label
    call s:HL('TabLineSel', s:red, s:none, s:bold)
  else
    call s:HL('TabLineFill', s:green, s:black)
    call s:HL('TabLineSel', s:red, s:black, s:bold)
  endif

  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  "
  if g:tlou2_inverse_match_paren == 1
    call s:HL('MatchParen', s:bright_magenta, s:none, s:inverse . s:bold)
  else
    call s:HL('MatchParen', s:bright_magenta, s:none, s:bold)
  endif
endif

if v:version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:xgray2)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  if g:tlou2_transparent_background == 1 && !has('gui_running')
    call s:HL('CursorLineNr', s:yellow, s:none)
  else
    call s:HL('CursorLineNr', s:yellow, s:black)
  endif

endif

hi! link NonText tlou2Xgray4
hi! link SpecialKey tlou2Xgray4

if g:tlou2_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:xgray2, s:bold)
endif

hi! link VisualNOS Visual

if g:tlou2_inverse == 1 && g:tlou2_inverse_matches == 1
  call s:HL('Search', s:none, s:none, s:inverse)
  call s:HL('IncSearch', s:none, s:none, s:inverse)
else
  call s:HL('Search', s:none, s:xgray5, s:bold)
  call s:HL('IncSearch', s:none, s:xgray5, s:underline . s:bold)
endif

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bright_white, s:xgray2)

if g:tlou2_transparent_background == 1 && !has('gui_running')
  call s:HL('StatusLineNC', s:bright_black, s:none, s:underline)

  " The column separating vertically split windows
  call s:HL('VertSplit', s:bright_white, s:none)

  " Current match in wildmenu completion
  call s:HL('WildMenu', s:blue, s:none, s:bold)
else
  call s:HL('StatusLineNC', s:bright_black, s:black, s:underline)
  call s:HL('VertSplit', s:bright_white, s:black)
  call s:HL('WildMenu', s:blue, s:black, s:bold)
endif

" Directory names, special names in listing
hi! link Directory tlou2GreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title tlou2GreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)
" More prompt: -- More --
hi! link MoreMsg tlou2YellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg tlou2YellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question tlou2OrangeBold
" Warning messages
hi! link WarningMsg tlou2RedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bright_black)

if g:tlou2_transparent_background == 1 && !has('gui_running')
  " Column where signs are displayed
  " TODO Possibly need to fix  SignColumn
  call s:HL('SignColumn', s:none, s:none)
  " Line used for closed folds
  call s:HL('Folded', s:bright_black, s:none, s:italic)
  " Column where folds are displayed
  call s:HL('FoldColumn', s:bright_black, s:none)
else
  call s:HL('SignColumn', s:none, s:black)
  call s:HL('Folded', s:bright_black, s:black, s:italic)
  call s:HL('FoldColumn', s:bright_black, s:black)
endif

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:black, s:yellow)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

hi! link Special tlou2Orange

call s:HL('Comment', s:bright_black, s:none, s:italic)

if g:tlou2_transparent_background == 1 && !has('gui_running')
  call s:HL('Todo', s:bright_white, s:none, s:bold . s:italic)
else
  call s:HL('Todo', s:bright_white, s:black, s:bold . s:italic)
endif

call s:HL('Error', s:bright_white, s:red, s:bold)

" String constant: "this is a string"
call s:HL('String',  s:bright_green)

" Generic statement
hi! link Statement tlou2Red
" if, then, else, endif, swicth, etc.
hi! link Conditional tlou2Red
" for, do, while, etc.
hi! link Repeat tlou2Red
" case, default, etc.
hi! link Label tlou2Red
" try, catch, throw
hi! link Exception tlou2Red
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword tlou2Red

" Variable name
hi! link Identifier tlou2Cyan
" Function name
hi! link Function tlou2Yellow

" Generic preprocessor
hi! link PreProc tlou2Cyan
" Preprocessor #include
hi! link Include tlou2Cyan
" Preprocessor #define
hi! link Define tlou2Cyan
" Same as Define
hi! link Macro tlou2Orange
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit tlou2Cyan

" Generic constant
hi! link Constant tlou2BrightMagenta
" Character constant: 'c', '/n'
hi! link Character tlou2BrightMagenta
" Boolean constant: TRUE, false
hi! link Boolean tlou2BrightMagenta
" Number constant: 234, 0xff
hi! link Number tlou2BrightMagenta
" Floating point constant: 2.3e10
hi! link Float tlou2BrightMagenta

" Generic type
hi! link Type tlou2BrightBlue
" static, register, volatile, etc
hi! link StorageClass tlou2Orange
" struct, union, enum, etc.
hi! link Structure tlou2Cyan
" typedef
hi! link Typedef tlou2Magenta

if g:tlou2_dim_lisp_paren == 1
  hi! link Delimiter tlou2Xgray6
else
  hi! link Delimiter tlou2BrightBlack
endif

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:xgray2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bright_white, s:magenta, s:bold)

  if g:tlou2_transparent_background == 1 && !has('gui_running')
    " Popup menu: scrollbar
    call s:HL('PmenuSbar', s:none, s:none)
    " Popup menu: scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:none)
  else
    call s:HL('PmenuSbar', s:none, s:black)
    call s:HL('PmenuThumb', s:none, s:black)
  endif
endif

" }}}
" Diffs: {{{

if g:tlou2_transparent_background == 1 && !has('gui_running')
  call s:HL('DiffDelete', s:red, s:none)
  call s:HL('DiffAdd',    s:green, s:none)
  call s:HL('DiffChange', s:cyan, s:none)
  call s:HL('DiffText',   s:yellow, s:none)
else
  call s:HL('DiffDelete', s:red, s:black)
  call s:HL('DiffAdd',    s:green, s:black)
  call s:HL('DiffChange', s:cyan, s:black)
  call s:HL('DiffText',   s:yellow, s:black)
endif

" }}}
" Spelling: {{{

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:magenta)
endif

" }}}
" Terminal: {{{

if has('terminal')
  " Must set an explicit background as NONE won't work
  " Therefore not useful with transparent background option
  call s:HL('Terminal', s:bright_white, s:hard_black)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" Sneak: {{{

hi! link Sneak Search
call s:HL('SneakScope', s:none, s:hard_black)
hi! link SneakLabel Search

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue',  '#2C78BF'], ['202',  '#FF5F00'],
      \ ['red',  '#EF2F27'], ['magenta', '#E02C6D']
    \ ]
endif

let g:rainbow_guifgs = [ '#E02C6D', '#EF2F27', '#D75F00', '#2C78BF']
let g:rainbow_ctermfgs = [ 'magenta', 'red', '202', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd tlou2Green
hi! link GitGutterChange tlou2Yellow
hi! link GitGutterDelete tlou2Red
hi! link GitGutterChangeDelete tlou2Yellow

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile tlou2Green
hi! link gitcommitDiscardedFile tlou2Red

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign tlou2Red
hi! link ALEWarningSign tlou2Yellow
hi! link ALEInfoSign tlou2Blue

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:bright_black)
call s:HL('IndentGuidesOdd',  s:none, s:bright_black)

" }}}
" vim-startify {{{

hi! link StartifyNumber Statement
hi! link StartifyFile Normal
hi! link StartifyPath String
hi! link StartifySlash Normal
hi! link StartifyBracket Comment
hi! link StartifyHeader Type
hi! link StartifyFooter Normal
hi! link StartifySpecial Comment
hi! link StartifySection Identifier

" }}}
" fzf: {{{

call s:HL('fzf1', s:magenta, s:xgray2)
call s:HL('fzf2', s:bright_green, s:xgray2)
call s:HL('fzf3', s:bright_white, s:xgray2)

"}}}
" Netrw: {{{

hi! link netrwDir tlou2Cyan
hi! link netrwClassify tlou2Cyan
hi! link netrwLink tlou2BrightBlack
hi! link netrwSymLink tlou2White
hi! link netrwExe tlou2Yellow
hi! link netrwComment tlou2BrightBlack
hi! link netrwList tlou2Blue
hi! link netrwTreeBar tlou2BrightBlack
hi! link netrwHelpCmd tlou2Cyan
hi! link netrwVersion tlou2Green
hi! link netrwCmdSep tlou2BrightBlack

"}}}
" coc.nvim: {{{

hi! link CocErrorSign tlou2Red
hi! link CocWarningSign tlou2BrightOrange
hi! link CocInfoSign tlou2Yellow
hi! link CocHintSign tlou2Blue
hi! link CocErrorFloat tlou2Red
hi! link CocWarningFloat tlou2Orange
hi! link CocInfoFloat tlou2Yellow
hi! link CocHintFloat tlou2Blue
hi! link CocDiagnosticsError tlou2Red
hi! link CocDiagnosticsWarning tlou2Orange
hi! link CocDiagnosticsInfo tlou2Yellow
hi! link CocDiagnosticsHint tlou2Blue

hi! link CocSelectedText tlou2Red
hi! link CocCodeLens tlou2White

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:bright_orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
" CtrlP: "{{{
hi! link CtrlPMatch tlou2Magenta
hi! link CtrlPLinePre tlou2BrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray3)
call s:HL('CtrlPMode2', s:bright_white, s:xgray5)
call s:HL('CtrlPStats', s:yellow, s:xgray2)
" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded tlou2Green
hi! link diffRemoved tlou2Red
hi! link diffChanged tlou2Cyan

hi! link diffFile tlou2Orange
hi! link diffNewFile tlou2Yellow

hi! link diffLine tlou2Blue

" }}}
" Html: {{{

hi! link htmlTag tlou2Blue
hi! link htmlEndTag tlou2Blue

hi! link htmlTagName tlou2Blue
hi! link htmlTag tlou2BrightBlack
hi! link htmlArg tlou2Yellow

hi! link htmlScriptTag tlou2Red
hi! link htmlTagN tlou2Blue
hi! link htmlSpecialTagName tlou2Blue

call s:HL('htmlLink', s:bright_white, s:none, s:underline)

hi! link htmlSpecialChar tlou2Yellow

if g:tlou2_transparent_background == 1 && !has('gui_running')
  call s:HL('htmlBold', s:bright_white, s:none, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:none, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:none, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:none, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:none, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:none, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:none, s:italic)
else
  call s:HL('htmlBold', s:bright_white, s:black, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:black, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:black, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:black, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:black, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:black, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:black, s:italic)
endif


" }}}
" Xml: {{{

hi! link xmlTag tlou2Blue
hi! link xmlEndTag tlou2Blue
hi! link xmlTagName tlou2Blue
hi! link xmlEqual tlou2Blue
hi! link docbkKeyword tlou2CyanBold

hi! link xmlDocTypeDecl tlou2BrightBlack
hi! link xmlDocTypeKeyword tlou2Magenta
hi! link xmlCdataStart tlou2BrightBlack
hi! link xmlCdataCdata tlou2Magenta
hi! link dtdFunction tlou2BrightBlack
hi! link dtdTagName tlou2Magenta

hi! link xmlAttrib tlou2Cyan
hi! link xmlProcessingDelim tlou2BrightBlack
hi! link dtdParamEntityPunct tlou2BrightBlack
hi! link dtdParamEntityDPunct tlou2BrightBlack
hi! link xmlAttribPunct tlou2BrightBlack

hi! link xmlEntity tlou2Yellow
hi! link xmlEntityPunct tlou2Yellow
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:bright_white, s:none, s:bold . s:italic)

hi! link vimNotation tlou2Yellow
hi! link vimBracket tlou2Yellow
hi! link vimMapModKey tlou2Yellow
hi! link vimFuncSID tlou2BrightWhite
hi! link vimSetSep tlou2BrightWhite
hi! link vimSep tlou2BrightWhite
hi! link vimContinue tlou2BrightWhite

" }}}
" Lisp dialects: {{{
if g:tlou2_dim_lisp_paren == 1
  hi! link schemeParentheses tlou2Xgray6
  hi! link clojureParen tlou2Xgray6
else
  hi! link schemeParentheses tlou2BrightBlack
  hi! link clojureParen tlou2BrightBlack
endif

hi! link clojureKeyword tlou2Blue
hi! link clojureCond tlou2Red
hi! link clojureSpecial tlou2Red
hi! link clojureDefine tlou2Red

hi! link clojureFunc tlou2Yellow
hi! link clojureRepeat tlou2Yellow
hi! link clojureCharacter tlou2Cyan
hi! link clojureStringEscape tlou2Cyan
hi! link clojureException tlou2Red

hi! link clojureRegexp tlou2Cyan
hi! link clojureRegexpEscape tlou2Cyan
call s:HL('clojureRegexpCharClass', s:bright_white, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureAnonArg tlou2Yellow
hi! link clojureVariable tlou2Blue
hi! link clojureMacro tlou2OrangeBold

hi! link clojureMeta tlou2Yellow
hi! link clojureDeref tlou2Yellow
hi! link clojureQuote tlou2Yellow
hi! link clojureUnquote tlou2Yellow
" }}}
" C: {{{

hi! link cOperator tlou2Magenta
hi! link cStructure tlou2Yellow

" }}}
" Python: {{{

hi! link pythonBuiltin tlou2Yellow
hi! link pythonBuiltinObj tlou2Yellow
hi! link pythonBuiltinFunc tlou2Yellow
hi! link pythonFunction tlou2Cyan
hi! link pythonDecorator tlou2Red
hi! link pythonInclude tlou2Blue
hi! link pythonImport tlou2Blue
hi! link pythonRun tlou2Blue
hi! link pythonCoding tlou2Blue
hi! link pythonOperator tlou2Red
hi! link pythonExceptions tlou2Magenta
hi! link pythonBoolean tlou2Magenta
hi! link pythonDot tlou2BrightWhite

" }}}
" CSS/SASS: {{{

hi! link cssBraces tlou2BrightWhite
hi! link cssFunctionName tlou2Yellow
hi! link cssIdentifier tlou2Blue
hi! link cssClassName tlou2Blue
hi! link cssClassNameDot tlou2Blue
hi! link cssColor tlou2BrightMagenta
hi! link cssSelectorOp tlou2Blue
hi! link cssSelectorOp2 tlou2Blue
hi! link cssImportant tlou2Green
hi! link cssVendor tlou2Blue
hi! link cssMediaProp tlou2Yellow
hi! link cssBorderProp tlou2Yellow
hi! link cssAttrComma tlou2BrightWhite

hi! link cssTextProp tlou2Yellow
hi! link cssAnimationProp tlou2Yellow
hi! link cssUIProp tlou2Yellow
hi! link cssTransformProp tlou2Yellow
hi! link cssTransitionProp tlou2Yellow
hi! link cssPrintProp tlou2Yellow
hi! link cssPositioningProp tlou2Yellow
hi! link cssBoxProp tlou2Yellow
hi! link cssFontDescriptorProp tlou2Yellow
hi! link cssFlexibleBoxProp tlou2Yellow
hi! link cssBorderOutlineProp tlou2Yellow
hi! link cssBackgroundProp tlou2Yellow
hi! link cssMarginProp tlou2Yellow
hi! link cssListProp tlou2Yellow
hi! link cssTableProp tlou2Yellow
hi! link cssFontProp tlou2Yellow
hi! link cssPaddingProp tlou2Yellow
hi! link cssDimensionProp tlou2Yellow
hi! link cssRenderProp tlou2Yellow
hi! link cssColorProp tlou2Yellow
hi! link cssGeneratedContentProp tlou2Yellow
hi! link cssTagName tlou2BrightBlue

" SASS
hi! link sassClass tlou2Blue
hi! link sassClassChar tlou2Blue
hi! link sassVariable tlou2Cyan
hi! link sassIdChar tlou2BrightBlue

" }}}
" JavaScript: {{{

hi! link javaScriptMember tlou2Blue
hi! link javaScriptNull tlou2Magenta

" }}}
" YAJS: {{{

hi! link javascriptParens tlou2BrightCyan
hi! link javascriptFuncArg Normal
hi! link javascriptDocComment tlou2Green
hi! link javascriptArrayMethod Function
hi! link javascriptReflectMethod Function
hi! link javascriptStringMethod Function
hi! link javascriptObjectMethod Function
hi! link javascriptObjectStaticMethod Function
hi! link javascriptObjectLabel tlou2Blue

hi! link javascriptProp tlou2Blue

hi! link javascriptVariable tlou2BrightBlue
hi! link javascriptOperator tlou2BrightCyan
hi! link javascriptFuncKeyword tlou2BrightRed
hi! link javascriptFunctionMethod tlou2Yellow
hi! link javascriptReturn tlou2BrightRed
hi! link javascriptEndColons Normal

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp tlou2BrightWhite
hi! link coffeeSpecialOp tlou2BrightWhite
hi! link coffeeCurly tlou2Yellow
hi! link coffeeParen tlou2BrightWhite
hi! link coffeeBracket tlou2Yellow

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter tlou2Green
hi! link rubyInterpolationDelimiter tlou2Cyan
hi! link rubyDefine Keyword

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier tlou2Red
hi! link objcDirective tlou2Blue

" }}}
" Go: {{{

hi! link goDirective tlou2Cyan
hi! link goConstants tlou2Magenta
hi! link goDeclaration tlou2Red
hi! link goDeclType tlou2Blue
hi! link goBuiltins tlou2Yellow

" }}}
" Lua: {{{

hi! link luaIn tlou2Red
hi! link luaFunction tlou2Cyan
hi! link luaTable tlou2Yellow

" }}}
" MoonScript: {{{

hi! link moonSpecialOp tlou2BrightWhite
hi! link moonExtendedOp tlou2BrightWhite
hi! link moonFunction tlou2BrightWhite
hi! link moonObject tlou2Yellow

" }}}
" Java: {{{

hi! link javaAnnotation tlou2Blue
hi! link javaDocTags tlou2Cyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen tlou2BrightWhite
hi! link javaParen1 tlou2BrightWhite
hi! link javaParen2 tlou2BrightWhite
hi! link javaParen3 tlou2BrightWhite
hi! link javaParen4 tlou2BrightWhite
hi! link javaParen5 tlou2BrightWhite
hi! link javaOperator tlou2Yellow

hi! link javaVarArg tlou2Green

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter tlou2Green
hi! link elixirInterpolationDelimiter tlou2Cyan

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition tlou2Blue
hi! link scalaCaseFollowing tlou2Blue
hi! link scalaCapitalWord tlou2Blue
hi! link scalaTypeExtension tlou2Blue

hi! link scalaKeyword tlou2Red
hi! link scalaKeywordModifier tlou2Red

hi! link scalaSpecial tlou2Cyan
hi! link scalaOperator tlou2Blue

hi! link scalaTypeDeclaration tlou2Yellow
hi! link scalaTypeTypePostDeclaration tlou2Yellow

hi! link scalaInstanceDeclaration tlou2Blue
hi! link scalaInterpolation tlou2Cyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:bright_white, s:none, s:italic)

hi! link markdownH1 tlou2GreenBold
hi! link markdownH2 tlou2GreenBold
hi! link markdownH3 tlou2YellowBold
hi! link markdownH4 tlou2YellowBold
hi! link markdownH5 tlou2Yellow
hi! link markdownH6 tlou2Yellow

hi! link markdownCode tlou2Cyan
hi! link markdownCodeBlock tlou2Cyan
hi! link markdownCodeDelimiter tlou2Cyan

hi! link markdownBlockquote tlou2BrightBlack
hi! link markdownListMarker tlou2BrightBlack
hi! link markdownOrderedListMarker tlou2BrightBlack
hi! link markdownRule tlou2BrightBlack
hi! link markdownHeadingRule tlou2BrightBlack

hi! link markdownUrlDelimiter tlou2BrightWhite
hi! link markdownLinkDelimiter tlou2BrightWhite
hi! link markdownLinkTextDelimiter tlou2BrightWhite

hi! link markdownHeadingDelimiter tlou2Yellow
hi! link markdownUrl tlou2Magenta
hi! link markdownUrlTitleDelimiter tlou2Green

call s:HL('markdownLinkText', s:bright_black, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType tlou2Yellow
" hi! link haskellOperators tlou2Yellow
" hi! link haskellConditional tlou2Cyan
" hi! link haskellLet tlou2Yellow
"
hi! link haskellType tlou2Blue
hi! link haskellIdentifier tlou2Blue
hi! link haskellSeparator tlou2Blue
hi! link haskellDelimiter tlou2BrightWhite
hi! link haskellOperators tlou2Blue
"
hi! link haskellBacktick tlou2Yellow
hi! link haskellStatement tlou2Yellow
hi! link haskellConditional tlou2Yellow

hi! link haskellLet tlou2Cyan
hi! link haskellDefault tlou2Cyan
hi! link haskellWhere tlou2Cyan
hi! link haskellBottom tlou2Cyan
hi! link haskellBlockKeywords tlou2Cyan
hi! link haskellImportKeywords tlou2Cyan
hi! link haskellDeclKeyword tlou2Cyan
hi! link haskellDeriving tlou2Cyan
hi! link haskellAssocType tlou2Cyan

hi! link haskellNumber tlou2Magenta
hi! link haskellPragma tlou2Magenta

hi! link haskellString tlou2Green
hi! link haskellChar tlou2Green

" }}}
" Json: {{{

hi! link jsonKeyword tlou2Green
hi! link jsonQuote tlou2Green
hi! link jsonBraces tlou2Blue
hi! link jsonString tlou2Blue

" }}}
" Rust: {{{
"https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim
hi! link rustCommentLineDoc tlou2Green
hi! link rustModPathSep tlou2BrightBlack
" }}}
" Make: {{{
hi! link makePreCondit tlou2Red
hi! link makeCommands tlou2BrightWhite
hi! link makeTarget tlou2Yellow
" }}}
" Misc: {{{
call s:HL('shParenError', s:bright_white, s:bright_red)
call s:HL('ExtraWhitespace', s:none, s:red)
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker :

