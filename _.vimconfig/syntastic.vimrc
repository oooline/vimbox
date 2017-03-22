""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" [on]
" https://github.com/vim-syntastic/syntastic/wiki/Syntax-Checkers
let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'
" [off] .cpp
let g:syntastic_ignore_files=[".*\.cpp$"]

