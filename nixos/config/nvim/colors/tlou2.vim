" -----------------------------------------------------------------------------
" Name:         tlou2
" Description:  Based on wallpaper from The Last of Us 2 
" Author:       Brandon Wright
" Website:      https://gitlab.com/branwright/non-flaked-nix/
" License:      MIT
" -----------------------------------------------------------------------------

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

let s:black          = ['#201e1a', 0]
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
let s:orange        = ['#84603C', 202]
let s:bright_orange = ['#84603C', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#272520', 236]
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

if !exists('g:tlou2_guisp_fallback') || index(['fg', 'bg'], g:srcery_guisp_fallback) == -1
  let g:tlou2_guisp_fallback='NONE'
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

  " special fallback
  if a:0 >= 3
    if g:tlou2_guisp_fallback !=# 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:tlou2_guisp_fallback ==# 'bg'
      let emstr .= 'inverse,'
    endif
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
" Tlou2 Hi Groups: {{{

" memoize common hi groups
call s:HL('Tlou2White', s:white)
call s:HL('Tlou2Red', s:red)
call s:HL('Tlou2Green', s:green)
call s:HL('Tlou2Yellow', s:yellow)
call s:HL('Tlou2Blue', s:blue)
call s:HL('Tlou2Magenta', s:magenta)
call s:HL('Tlou2Cyan', s:cyan)
call s:HL('Tlou2Black', s:black)

call s:HL('Tlou2RedBold', s:red, s:none, s:bold)
call s:HL('Tlou2GreenBold', s:green, s:none, s:bold)
call s:HL('Tlou2YellowBold', s:yellow, s:none, s:bold)
call s:HL('Tlou2BlueBold', s:blue, s:none, s:bold)
call s:HL('Tlou2MagentaBold', s:magenta, s:none, s:bold)
call s:HL('Tlou2CyanBold', s:cyan, s:none, s:bold)

call s:HL('Tlou2BrightRed', s:bright_red, s:none)
call s:HL('Tlou2BrightGreen', s:bright_green, s:none)
call s:HL('Tlou2BrightYellow', s:bright_yellow, s:none)
call s:HL('Tlou2BrightBlue', s:bright_blue, s:none)
call s:HL('Tlou2BrightMagenta', s:bright_magenta, s:none)
call s:HL('Tlou2BrightCyan', s:bright_cyan, s:none)
call s:HL('Tlou2BrightBlack', s:bright_black, s:none)
call s:HL('Tlou2BrightWhite', s:bright_white)

" special
call s:HL('Tlou2Orange', s:orange)
call s:HL('Tlou2BrightOrange', s:bright_orange)
call s:HL('Tlou2OrangeBold', s:orange, s:none, s:bold)
call s:HL('Tlou2HardBlack', s:hard_black)
call s:HL('Tlou2Xgray1', s:xgray1)
call s:HL('Tlou2Xgray2', s:xgray2)
call s:HL('Tlou2Xgray3', s:xgray3)
call s:HL('Tlou2Xgray4', s:xgray4)
call s:HL('Tlou2Xgray5', s:xgray5)
call s:HL('Tlou2Xgray6', s:xgray6)

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

  call s:HL('TabLineFill', s:bright_black, s:xgray2)
  call s:HL('TabLineSel', s:bright_white, s:xgray5)

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

hi! link NonText Tlou2Xgray4
hi! link SpecialKey Tlou2Blue

if g:tlou2_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:xgray2, s:bold)
endif

hi! link VisualNOS Visual

if g:tlou2_inverse == 1 && g:srcery_inverse_matches == 1
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
hi! link Directory Tlou2GreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title Tlou2GreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)
" More prompt: -- More --
hi! link MoreMsg Tlou2YellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg Tlou2YellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question Tlou2OrangeBold
" Warning messages
hi! link WarningMsg Tlou2RedBold

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

hi! link Special Tlou2Orange

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
hi! link Statement Tlou2Red
" if, then, else, endif, swicth, etc.
hi! link Conditional Tlou2Red
" for, do, while, etc.
hi! link Repeat Tlou2Red
" case, default, etc.
hi! link Label Tlou2Red
" try, catch, throw
hi! link Exception Tlou2Red
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword Tlou2Red

" Variable name
hi! link Identifier Tlou2Cyan
" Function name
hi! link Function Tlou2Yellow

" Generic preprocessor
hi! link PreProc Tlou2Cyan
" Preprocessor #include
hi! link Include Tlou2Cyan
" Preprocessor #define
hi! link Define Tlou2Cyan
" Same as Define
hi! link Macro Tlou2Orange
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit Tlou2Cyan

" Generic constant
hi! link Constant Tlou2BrightMagenta
" Character constant: 'c', '/n'
hi! link Character Tlou2BrightMagenta
" Boolean constant: TRUE, false
hi! link Boolean Tlou2BrightMagenta
" Number constant: 234, 0xff
hi! link Number Tlou2BrightMagenta
" Floating point constant: 2.3e10
hi! link Float Tlou2BrightMagenta

" Generic type
if get(g:, 'tlou2_italic_types', 0) == 1
  call s:HL('Type', s:bright_blue, s:none, s:italic)
else
  hi! link Type Tlou2BrightBlue
end
" static, register, volatile, etc
hi! link StorageClass Tlou2Orange
" struct, union, enum, etc.
hi! link Structure Tlou2Cyan
" typedef
hi! link Typedef Tlou2Magenta

if g:tlou2_dim_lisp_paren == 1
  hi! link Delimiter Tlou2Xgray6
else
  hi! link Delimiter Tlou2BrightBlack
endif

" Treesitter
call s:HL('TSParameter', s:cyan, s:none, s:italic)

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:xgray2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:black, s:green, s:bold)

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
" Neovim's builtin LSP: {{{

hi! link LspDiagnosticsDefaultError Tlou2BrightRed
hi! link LspDiagnosticsDefaultWarning Tlou2BrightYellow
hi! link LspDiagnosticsDefaultInformation Tlou2BrightGreen
hi! link LspDiagnosticsDefaultHint Tlou2BrightCyan
call s:HL('LspDiagnosticsUnderlineError', s:bright_red, s:none, s:underline)
call s:HL('LspDiagnosticsUnderlineWarning', s:bright_yellow, s:none, s:underline)
call s:HL('LspDiagnosticsUnderlineInformation', s:bright_green, s:none, s:underline)
call s:HL('LspDiagnosticsUnderlineHint', s:bright_cyan, s:none, s:underline)

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

hi! link GitGutterAdd Tlou2Green
hi! link GitGutterChange Tlou2Yellow
hi! link GitGutterDelete Tlou2Red
hi! link GitGutterChangeDelete Tlou2Yellow

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile Tlou2Green
hi! link gitcommitDiscardedFile Tlou2Red

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign Tlou2Red
hi! link ALEWarningSign Tlou2Yellow
hi! link ALEInfoSign Tlou2Blue

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:xgray3)
call s:HL('IndentGuidesOdd',  s:none, s:xgray4)

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

hi! link netrwDir Tlou2Blue
hi! link netrwClassify Tlou2Cyan
hi! link netrwLink Tlou2BrightBlack
hi! link netrwSymLink Tlou2Cyan
hi! link netrwExe Tlou2Yellow
hi! link netrwComment Tlou2BrightBlack
hi! link netrwList Tlou2BrightBlue
hi! link netrwTreeBar Tlou2BrightBlack
hi! link netrwHelpCmd Tlou2Cyan
hi! link netrwVersion Tlou2Green
hi! link netrwCmdSep Tlou2BrightBlack

"}}}
" coc.nvim: {{{

hi! link CocErrorSign Tlou2Red
hi! link CocWarningSign Tlou2BrightOrange
hi! link CocInfoSign Tlou2Yellow
hi! link CocHintSign Tlou2Blue
hi! link CocErrorFloat Tlou2Red
hi! link CocWarningFloat Tlou2Orange
hi! link CocInfoFloat Tlou2Yellow
hi! link CocHintFloat Tlou2Blue
hi! link CocDiagnosticsError Tlou2Red
hi! link CocDiagnosticsWarning Tlou2Orange
hi! link CocDiagnosticsInfo Tlou2Yellow
hi! link CocDiagnosticsHint Tlou2Blue

hi! link CocSelectedText Tlou2Red
hi! link CocCodeLens Tlou2White

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:bright_orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
" CtrlP: "{{{
"
hi! link CtrlPMatch Tlou2Magenta
hi! link CtrlPLinePre Tlou2BrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray3)
call s:HL('CtrlPMode2', s:bright_white, s:xgray5)
call s:HL('CtrlPStats', s:yellow, s:xgray2)

" }}}
" NERDTree: "{{{

hi! link NERDTreeDir Tlou2Blue
hi! link NERDTreeDirSlash Tlou2Cyan
hi! link NERDTreeOpenable Tlou2Blue
hi! link NERDTreeClosable Tlou2Blue
hi! link NERDTreeFile Tlou2White
hi! link NERDTreeExecFile Tlou2Yellow
hi! link NERDTreeUp Tlou2Orange
hi! link NERDTreeCWD Tlou2Green
hi! link NERDTreeHelp Tlou2Cyan
hi! link NERDTreeFlags Tlou2Cyan
hi! link NERDTreeLinkFile Tlou2BrightBlack
hi! link NERDTreeLinkTarget Tlou2BrightBlack

" }}}
" Telescope: "{{{

call s:HL('TelescopeNormal', s:white, s:none)
call s:HL('TelescopeSelection', s:green, s:none, s:bold)
call s:HL('TelescopeMatching', s:magenta)
call s:HL('TelescopeSelectionCaret', s:magenta)
call s:HL('TelescopePromptPrefix', s:bright_yellow)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded Tlou2Green
hi! link diffRemoved Tlou2Red
hi! link diffChanged Tlou2Cyan

hi! link diffFile Tlou2Orange
hi! link diffNewFile Tlou2Yellow

hi! link diffLine Tlou2Blue

" }}}
" Html: {{{

hi! link htmlTag Tlou2Blue
hi! link htmlEndTag Tlou2Blue

hi! link htmlTagName Tlou2Blue
hi! link htmlTag Tlou2BrightBlack
hi! link htmlArg Tlou2Yellow

hi! link htmlScriptTag Tlou2Red
hi! link htmlTagN Tlou2Blue
hi! link htmlSpecialTagName Tlou2Blue

call s:HL('htmlLink', s:bright_white, s:none, s:underline)

hi! link htmlSpecialChar Tlou2Yellow

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

hi! link xmlTag Tlou2Blue
hi! link xmlEndTag Tlou2Blue
hi! link xmlTagName Tlou2Blue
hi! link xmlEqual Tlou2Blue
hi! link docbkKeyword Tlou2CyanBold

hi! link xmlDocTypeDecl Tlou2BrightBlack
hi! link xmlDocTypeKeyword Tlou2Magenta
hi! link xmlCdataStart Tlou2BrightBlack
hi! link xmlCdataCdata Tlou2Magenta
hi! link dtdFunction Tlou2BrightBlack
hi! link dtdTagName Tlou2Magenta

hi! link xmlAttrib Tlou2Cyan
hi! link xmlProcessingDelim Tlou2BrightBlack
hi! link dtdParamEntityPunct Tlou2BrightBlack
hi! link dtdParamEntityDPunct Tlou2BrightBlack
hi! link xmlAttribPunct Tlou2BrightBlack

hi! link xmlEntity Tlou2Yellow
hi! link xmlEntityPunct Tlou2Yellow

" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:bright_white, s:none, s:bold . s:italic)

hi! link vimNotation Tlou2Yellow
hi! link vimBracket Tlou2Yellow
hi! link vimMapModKey Tlou2Yellow
hi! link vimFuncSID Tlou2BrightWhite
hi! link vimSetSep Tlou2BrightWhite
hi! link vimSep Tlou2BrightWhite
hi! link vimContinue Tlou2BrightWhite

" }}}
" Lisp dialects: {{{

if g:tlou2_dim_lisp_paren == 1
  hi! link schemeParentheses Tlou2Xgray6
  hi! link clojureParen Tlou2Xgray6
else
  hi! link schemeParentheses Tlou2BrightBlack
  hi! link clojureParen Tlou2BrightBlack
endif

hi! link clojureKeyword Tlou2Blue
hi! link clojureCond Tlou2Red
hi! link clojureSpecial Tlou2Red
hi! link clojureDefine Tlou2Red

hi! link clojureFunc Tlou2Yellow
hi! link clojureRepeat Tlou2Yellow
hi! link clojureCharacter Tlou2Cyan
hi! link clojureStringEscape Tlou2Cyan
hi! link clojureException Tlou2Red

hi! link clojureRegexp Tlou2Cyan
hi! link clojureRegexpEscape Tlou2Cyan
call s:HL('clojureRegexpCharClass', s:bright_white, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureAnonArg Tlou2Yellow
hi! link clojureVariable Tlou2Blue
hi! link clojureMacro Tlou2OrangeBold

hi! link clojureMeta Tlou2Yellow
hi! link clojureDeref Tlou2Yellow
hi! link clojureQuote Tlou2Yellow
hi! link clojureUnquote Tlou2Yellow

" }}}
" C: {{{

hi! link cOperator Tlou2Magenta
hi! link cStructure Tlou2Yellow

" }}}
" Python: {{{

hi! link pythonBuiltin Tlou2Yellow
hi! link pythonBuiltinObj Tlou2Yellow
hi! link pythonBuiltinFunc Tlou2Yellow
hi! link pythonFunction Tlou2Cyan
hi! link pythonDecorator Tlou2Red
hi! link pythonInclude Tlou2Blue
hi! link pythonImport Tlou2Blue
hi! link pythonRun Tlou2Blue
hi! link pythonCoding Tlou2Blue
hi! link pythonOperator Tlou2Red
hi! link pythonExceptions Tlou2Magenta
hi! link pythonBoolean Tlou2Magenta
hi! link pythonDot Tlou2BrightWhite

" }}}
" CSS/SASS: {{{

hi! link cssBraces Tlou2BrightWhite
hi! link cssFunctionName Tlou2Yellow
hi! link cssIdentifier Tlou2Blue
hi! link cssClassName Tlou2Blue
hi! link cssClassNameDot Tlou2Blue
hi! link cssColor Tlou2BrightMagenta
hi! link cssSelectorOp Tlou2Blue
hi! link cssSelectorOp2 Tlou2Blue
hi! link cssImportant Tlou2Green
hi! link cssVendor Tlou2Blue
hi! link cssMediaProp Tlou2Yellow
hi! link cssBorderProp Tlou2Yellow
hi! link cssAttrComma Tlou2BrightWhite

hi! link cssTextProp Tlou2Yellow
hi! link cssAnimationProp Tlou2Yellow
hi! link cssUIProp Tlou2Yellow
hi! link cssTransformProp Tlou2Yellow
hi! link cssTransitionProp Tlou2Yellow
hi! link cssPrintProp Tlou2Yellow
hi! link cssPositioningProp Tlou2Yellow
hi! link cssBoxProp Tlou2Yellow
hi! link cssFontDescriptorProp Tlou2Yellow
hi! link cssFlexibleBoxProp Tlou2Yellow
hi! link cssBorderOutlineProp Tlou2Yellow
hi! link cssBackgroundProp Tlou2Yellow
hi! link cssMarginProp Tlou2Yellow
hi! link cssListProp Tlou2Yellow
hi! link cssTableProp Tlou2Yellow
hi! link cssFontProp Tlou2Yellow
hi! link cssPaddingProp Tlou2Yellow
hi! link cssDimensionProp Tlou2Yellow
hi! link cssRenderProp Tlou2Yellow
hi! link cssColorProp Tlou2Yellow
hi! link cssGeneratedContentProp Tlou2Yellow
hi! link cssTagName Tlou2BrightBlue

" SASS
hi! link sassClass Tlou2Blue
hi! link sassClassChar Tlou2Blue
hi! link sassVariable Tlou2Cyan
hi! link sassIdChar Tlou2BrightBlue

" }}}
" JavaScript: {{{

hi! link javaScriptMember Tlou2Blue
hi! link javaScriptNull Tlou2Magenta

" }}}
" YAJS: {{{

hi! link javascriptParens Tlou2BrightCyan
hi! link javascriptFuncArg Normal
hi! link javascriptDocComment Tlou2Green
hi! link javascriptArrayMethod Function
hi! link javascriptReflectMethod Function
hi! link javascriptStringMethod Function
hi! link javascriptObjectMethod Function
hi! link javascriptObjectStaticMethod Function
hi! link javascriptObjectLabel Tlou2Blue

hi! link javascriptProp Tlou2Blue

hi! link javascriptVariable Tlou2BrightBlue
hi! link javascriptOperator Tlou2BrightCyan
hi! link javascriptFuncKeyword Tlou2BrightRed
hi! link javascriptFunctionMethod Tlou2Yellow
hi! link javascriptReturn Tlou2BrightRed
hi! link javascriptEndColons Normal

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp Tlou2BrightWhite
hi! link coffeeSpecialOp Tlou2BrightWhite
hi! link coffeeCurly Tlou2Yellow
hi! link coffeeParen Tlou2BrightWhite
hi! link coffeeBracket Tlou2Yellow

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter Tlou2Green
hi! link rubyInterpolationDelimiter Tlou2Cyan
hi! link rubyDefine Keyword

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier Tlou2Red
hi! link objcDirective Tlou2Blue

" }}}
" Go: {{{

hi! link goDirective Tlou2Cyan
hi! link goConstants Tlou2Magenta
hi! link goDeclaration Tlou2Red
hi! link goDeclType Tlou2Blue
hi! link goBuiltins Tlou2Yellow

" }}}
" Lua: {{{

hi! link luaIn Tlou2Red
hi! link luaFunction Tlou2Cyan
hi! link luaTable Tlou2Yellow

" }}}
" MoonScript: {{{

hi! link moonSpecialOp Tlou2BrightWhite
hi! link moonExtendedOp Tlou2BrightWhite
hi! link moonFunction Tlou2BrightWhite
hi! link moonObject Tlou2Yellow

" }}}
" Java: {{{

hi! link javaAnnotation Tlou2Blue
hi! link javaDocTags Tlou2Cyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen Tlou2BrightWhite
hi! link javaParen1 Tlou2BrightWhite
hi! link javaParen2 Tlou2BrightWhite
hi! link javaParen3 Tlou2BrightWhite
hi! link javaParen4 Tlou2BrightWhite
hi! link javaParen5 Tlou2BrightWhite
hi! link javaOperator Tlou2Yellow

hi! link javaVarArg Tlou2Green

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter Tlou2Green
hi! link elixirInterpolationDelimiter Tlou2Cyan

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition Tlou2Blue
hi! link scalaCaseFollowing Tlou2Blue
hi! link scalaCapitalWord Tlou2Blue
hi! link scalaTypeExtension Tlou2Blue

hi! link scalaKeyword Tlou2Red
hi! link scalaKeywordModifier Tlou2Red

hi! link scalaSpecial Tlou2Cyan
hi! link scalaOperator Tlou2Blue

hi! link scalaTypeDeclaration Tlou2Yellow
hi! link scalaTypeTypePostDeclaration Tlou2Yellow

hi! link scalaInstanceDeclaration Tlou2Blue
hi! link scalaInterpolation Tlou2Cyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:bright_white, s:none, s:italic)

hi! link markdownH1 Tlou2GreenBold
hi! link markdownH2 Tlou2GreenBold
hi! link markdownH3 Tlou2YellowBold
hi! link markdownH4 Tlou2YellowBold
hi! link markdownH5 Tlou2Yellow
hi! link markdownH6 Tlou2Yellow

hi! link markdownCode Tlou2Cyan
hi! link markdownCodeBlock Tlou2Cyan
hi! link markdownCodeDelimiter Tlou2Cyan

hi! link markdownBlockquote Tlou2BrightBlack
hi! link markdownListMarker Tlou2BrightBlack
hi! link markdownOrderedListMarker Tlou2BrightBlack
hi! link markdownRule Tlou2BrightBlack
hi! link markdownHeadingRule Tlou2BrightBlack

hi! link markdownUrlDelimiter Tlou2BrightWhite
hi! link markdownLinkDelimiter Tlou2BrightWhite
hi! link markdownLinkTextDelimiter Tlou2BrightWhite

hi! link markdownHeadingDelimiter Tlou2Yellow
hi! link markdownUrl Tlou2Magenta
hi! link markdownUrlTitleDelimiter Tlou2Green

call s:HL('markdownLinkText', s:bright_black, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType Tlou2Yellow
" hi! link haskellOperators Tlou2Yellow
" hi! link haskellConditional Tlou2Cyan
" hi! link haskellLet Tlou2Yellow

hi! link haskellType Tlou2Blue
hi! link haskellIdentifier Tlou2Blue
hi! link haskellSeparator Tlou2Blue
hi! link haskellDelimiter Tlou2BrightWhite
hi! link haskellOperators Tlou2Blue

hi! link haskellBacktick Tlou2Yellow
hi! link haskellStatement Tlou2Yellow
hi! link haskellConditional Tlou2Yellow

hi! link haskellLet Tlou2Cyan
hi! link haskellDefault Tlou2Cyan
hi! link haskellWhere Tlou2Cyan
hi! link haskellBottom Tlou2Cyan
hi! link haskellBlockKeywords Tlou2Cyan
hi! link haskellImportKeywords Tlou2Cyan
hi! link haskellDeclKeyword Tlou2Cyan
hi! link haskellDeriving Tlou2Cyan
hi! link haskellAssocType Tlou2Cyan

hi! link haskellNumber Tlou2Magenta
hi! link haskellPragma Tlou2Magenta

hi! link haskellString Tlou2Green
hi! link haskellChar Tlou2Green

" }}}
" Json: {{{

hi! link jsonKeyword Tlou2Green
hi! link jsonQuote Tlou2Green
hi! link jsonBraces Tlou2Blue
hi! link jsonString Tlou2Blue

" }}}
" Rust: {{{

"https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim
hi! link rustCommentLineDoc Tlou2Green
hi! link rustModPathSep Tlou2BrightBlack

" }}}
" Make: {{{

hi! link makePreCondit Tlou2Red
hi! link makeCommands Tlou2BrightWhite
hi! link makeTarget Tlou2Yellow

" }}}
" Misc: {{{

call s:HL('shParenError', s:bright_white, s:bright_red)
call s:HL('ExtraWhitespace', s:none, s:red)

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker :
