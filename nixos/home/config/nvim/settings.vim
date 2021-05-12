" Neovim settings

syntax on
set title
set hidden
set number relativenumber
set cursorline
set ruler
set mouse=a
set linebreak
set tabstop=2
set expandtab ts=4 sw=4 ai
" set showtabline=2
set termguicolors
set noshowmode
set background=dark
set encoding=UTF-8
set clipboard+=unnamedplus

let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material

" Plugin settings
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 25
let g:nvim_tree_auto_open = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'icons': 1,
    \}
let g:nvim_tree_indent_markers = 1


let g:zig_fmt_autosave = 1

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

let g:indentLine_fileTypeExclude = ['dashboard']

" ] ---- Dashboard Header ---- [
"
let g:dashboard_custom_header = [
\'  ████     ██                           ██             ',
\' ░██░██   ░██                          ░░              ',
\' ░██░░██  ░██  █████   ██████  ██    ██ ██ ██████████  ',
\' ░██ ░░██ ░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██ ',
\' ░██  ░░██░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██ ',
\' ░██   ░░████░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██ ',
\' ░██    ░░███░░██████░░██████   ░░██   ░██ ███ ░██ ░██ ',
\' ░░      ░░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░  ',
\ '',
\]
let g:dashboard_default_executive ='telescope'
