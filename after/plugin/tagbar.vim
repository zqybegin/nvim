" vim should be closed if tagbar and netrw are the last windows open.
let g:tagbar_autoclose_netrw = 1
" set tagbar open position
let g:tagbar_position = 'botright vertical'
let g:tagbar_width = max([15, winwidth(0) / 7])
" tag are sorted according to their order in the source fi[[l
let g:tagbar_sort = 0
let g:tagbar_indent = 1
" don't show visibility of function
let g:tagbar_show_visibility = 0
" change word
let g:tagbar_iconchars = ['▶', '▼']
