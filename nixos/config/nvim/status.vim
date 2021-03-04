let g:currentmode = { 
      \ 'n' : 'normal',
      \ 'i' : 'insert',
      \ 'r' : 'replace',
      \ 'v' : 'visual',
      \ 'V' : 'v·line',
      \ "\<C-v>": 'v·block',
      \ 'c' : 'command',
      \ 's' : 'select',
      \ 'S' : 's·line',
      \ "\<C-s>": 's·block',
      \ 't': 'terminal',
      \ }

set statusline=\ %{g:currentmode[mode()]}\ 
set statusline+=%#SLEmpty#
set statusline+=%=
set statusline+=%#SLAlt#
set statusline+=%y
set statusline+=\ %#StatusLine#
set statusline+=\ %l/%L\ 

hi StatusLine    ctermfg=black ctermbg=red
hi StatusLineNC  ctermfg=red   ctermbg=8
hi SLAlt         ctermfg=red   ctermbg=8
hi SLEmpty       ctermfg=8     ctermbg=8    cterm=none
