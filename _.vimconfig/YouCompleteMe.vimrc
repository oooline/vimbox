"let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0 " 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_collect_identifiers_from_tags_files = 1 " 开启基于tag的补全，可以在这之后添加需要的标签路径
"let g:ycm_seed_identifiers_with_syntax = 1 " 开启语义补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
"let g:ycm_min_num_of_chars_for_completion= 2 " 输入第 2 个字符开始补全
"let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
"let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>'] "定义快捷健补全
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" disable ycm
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}

" 设置关健字触发补全
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', ' ', '(', '[', '&'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "定义函数跟踪快捷健

" Enable omni completion. <C-x-o>
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown,twig setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

