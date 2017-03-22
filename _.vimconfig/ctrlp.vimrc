""" ctrlp
" <C>-j/k 上下选择
" <C>-x   水平分屏打开
" <C>-v   垂直分屏
" <C>-t   在tab中打开

""" ctrlp-funky
" <leader>fu 进入当前文件的函数列表
" <leader>fU 搜索当前光标下单词对应的函数

""" nerdtree
" F5 目录浏览

""" tagbar
" F6 文件结构Class outline(#apt i ctags)

""" vim-airline

"""'''''''''''''''''''''''''''''''''''''''''''''''''''''''


""" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <c-f> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

""" ctrlp-funky
nnoremap <leader>cu :CtrlPFunky<Cr>
nnoremap <leader>cU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1


""" nerdtree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let g:winManagerWidth=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>


""" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
let g:tagbar_type_ps1 = {
    \ 'ctagstype' : 'powershell',
    \ 'kinds'     : [
        \ 'f:function',
        \ 'i:filter',
        \ 'a:alias'
    \ ]
    \ }


""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme="luna" 
""tabline on (Buffer)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
""switch Buffer
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
""off white space count
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

