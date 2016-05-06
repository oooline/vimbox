" 设置风格
" Theme:desert
colorscheme desert
"colorscheme pablo 
set background=dark
"set background=light freya blackdust lucius rainbow_neon navajo slate (droid sans mono)
 
" 设置环境
function! MySys()
    if has("win32")
        return "win32"
    elseif has("unix")
        return "unix"
    else
        return "mac"
    endif
endfunction
 
" Set shell to be bash
if MySys() == "unix" || MySys() == "mac"
set shell=bash
else
" change it when move to win32
set shell=E:cygwininsh
endif
" 最大化 gvim 窗口
if MySys() == "win32"
    if has("autocmd")
        au GUIEnter * simalt ~x
    endif
else
    function Maximize_Window()
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction
endif


" 插件管理A  初始化
"set nocompatible              " be iMproved
"filetype off                  " required!
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" 插件管理A 加载插件
" Emmet
"Bundle "mattn/emmet-vim"
"Bundle "Shougo/neocomplcache.vim"
"
" 插件管理B  初始化
" Load pathogen plugin
call pathogen#infect()
call pathogen#helptags()

 
" 编码处理
" 缓存区/需等同于你的Locale
set encoding=utf-8
" 编辑/保存编码
"set fileencoding=gb2312
" 探测编码并打开文件
set fileencodings=utf-8,chinese,gb18020,big5,latin-1
if MySys() == "win32"
    set fileencodings=chinese
else
    set fileencodings=utf-8
endif
" Windows菜单乱码
if MySys() == "win32"
    set go-=m "去掉菜单
    set go-=T "去掉工具条
    "go-=r  "去掉右边的滚动条
    "go-=b  "去掉下边的滚动条
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " Consle输出乱码
    language messages zh_CN.utf-8
endif

" 自动切换当前目录
set autochdir
" 设置历史命令列表长度
set history=50
" 显示输入的命令
set showcmd
" 关闭兼容 vi
set nocompatible
" 设置swp目录(mkdir ~/.vimswp)
set directory=~/.vimswp
 
" 侦测文件类型/载入文件类型插件/特定类型载入相关缩进文件/智能补全
filetype plugin indent on
" 语法高亮
syntax on
" 高亮搜索
set hlsearch
" 增量搜索
set incsearch
" 搜索时忽略大小写，但如果搜索词包含大写则不忽略
set ignorecase smartcase
" 一个Tab键缩进4格
set tabstop=4
" 缩进4格
set shiftwidth=4
" 缩进格式(根据语言自定义)
au FileType html,vim,javascript,tpl,twig setl shiftwidth=2
au FileType html,vim,javascript,tpl,twig setl tabstop=2
au FileType java,php,python setl shiftwidth=4
au FileType java,php,python setl tabstop=4
" 软 tab，保持连续 tab 用空格代替
set softtabstop=4
" 退格可以删除4个空格
set smarttab
" 使用空格代替制表符
set expandtab
"自动补全命令时使用菜单形式显示
set wildmenu 
" 继承前一行缩进方式
set autoindent
" 智能缩进
set smartindent
"插入模式下，“←”如何删除光标前的字符：行首空白、换行符、插入点之前的字符
set backspace=indent,eol,start
"set backspace=2
" 当光标到达行尾或者行首时，继续移动转至下一行或者上一行
set whichwrap=b,s,<,>,[,]
" 光标移动到 buffer 的顶部和底部时保持3行距离
set scrolloff=6
" 括号匹配高亮
set showmatch
" 启用鼠标右键
"set mouse=a
"显示标尺
set ruler
" 显示中文帮助信息
set helplang=cn

" 2个任务栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

" c/c++缩进方式
set cindent
set cino=j1

" 文本/注释换行方式
set formatoptions=rotcql
set ic "ignore case
"set completeopt=longest,menu "关闭自动补全预览窗口
 
" 自动备份
"if has("vms")
"	set nobackup
"else
"	set backup
"endif
" 自动保存
set autowrite

" 显示行号
set nu
"GUI
"highlight LineNr guibg=darkgrey guifg=white
"term
highlight LineNr ctermbg=darkgrey ctermfg=grey 
" 定义Function配色:粗体/下划线/绿色/红色背景
"highlight Function cterm=bold,underline ctermbg=darkgrey ctermfg=green
 

" 自定义输入配对
inoremap phps <?php<CR>?><ESC>ko
"    iab phps <?php<CR>?><ESC>ko
inoremap jj <ESC> 
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap > <c-r>=ClosePair('>')<CR>
"inoremap { {<CR>}<ESC>ko
"inoremap {<CR> {<CR>}<ESC>ko
inoremap { <c-r>=OpenPair()<CR>
inoremap } <c-r>=ClosePair('}')<CR>
"若左侧紧邻左括号，则输入右括号存在时直接跳格
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
"花括号根据情景换行
function OpenPair()
    let line = getline('.')
    if -1 != match(line, 'function \|class ')
        return "{\<CR>}\<ESC>ko"
    else
        return "{}\<ESC>i"
    endif
endfunction


 " 折叠标记宽度
"set foldcolumn=4
" 光标越到折叠即打开
"set foldopen=all
" 用语法高亮来定义折叠
set foldmethod=syntax     " 语法高亮折叠
"set foldmethod=indent    " 更多的缩进表示更高级别的折叠
" 依标记折叠
set foldmethod=marker


"""""""""
" PHP配置
"""""""""
" 支持识别EOT字符串
hi link phpheredoc string
" 折叠
let php_folding = 1
" 缩进
let PHP_autoformatcomment=1
" PHP注释 [C+P]
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
" PHP文档(phpdoc/doc/*)
set runtimepath+=~/.vim/phpdoc
" 启动帮助 快捷键普通模式下 : K
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"


"""""""""
" JavaScript
"""""""""
" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1


au FileType html set ft=xml
au FileType html set syntax=html
au FileType twig set ft=xml
au FileType twig set syntax=html
"xmledit
let xml_use_xhtml = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 各插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" -------- NERDTree begin
"size of the NERD tree
" let NERDTreeWinSize = 31
" 
" " Open and close the NERD_tree.vim separately
" nmap <F2> <ESC>:NERDTreeToggle<RETURN>
" -------- NERDTree end
 
" -------- SuperTab begin
" 设置SuperTab，用tab键打开cppcomplet的自动补全功能。 
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" -------- SuperTab end
 
" -------- neocomplcache begin
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3
" This variable controls the number of the input completioning at the time of manual completion. 
let g:neocomplcache_manual_completion_start_length = 3
" 
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" This variable controls the number of candidates displayed in a pop-up menu. 
let g:neocomplcache_max_list = 10
" When neocomplcache displays candidates, this option controls whether neocomplcache selects the first candidate automatically.  If you enable this option, neocomplcache's completion behaivior is like |AutoComplPop|.
let g:neocomplcache_enable_auto_select = 1
" Recommended key-mappings. 
" <CR>: close popup and save indent. 
" inoremap <expr><CR>  (pumvisible() ? "\<C-y>":'') . "\<C-f>\<CR>X\<BS>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> pumvisible() ? neocomplcache#close_popup()."\<C-h>" : "\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown,twig setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
 
" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 
" -------- neocomplcache end
 
" ctags
set tags=tags;
"list more funciton-link
map <C-]> g<C-]>  
" tags list
map fun :TlistOpen
map cls :TlistClose

"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Highlight_Tag = 1 "高亮显示当前标签
let Tlist_Auto_Open = 0   "自动打开Tlist
let Tlist_Auto_Update = 1 "自动更新Tlist
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Show_Menu = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_WinWidth = 30
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
 

" cscope( Examine a C program source )
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
 
function Do_CsTag()
  let dir = getcwd()
  if filereadable("tags")
    if(MySys() == "win32")
      let tagsdeleted=delete(dir."\\"."tags")
    else
      let tagsdeleted=delete("./"."tags")
    endif
    if(tagsdeleted!=0)
      echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
      return
    endif
  endif
  if has("cscope")
    silent! execute "cs kill -1"
  endif
  if filereadable("cscope.files")
    if(MySys() == "win32")
      let csfilesdeleted=delete(dir."\\"."cscope.files")
    else
      let csfilesdeleted=delete("./"."cscope.files")
    endif
    if(csfilesdeleted!=0)
      echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
      return
    endif
  endif
  if filereadable("cscope.out")
    if(MySys() == "win32")
      let csoutdeleted=delete(dir."\\"."cscope.out")
    else
      let csoutdeleted=delete("./"."cscope.out")
    endif
    if(csoutdeleted!=0)
      echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
      return
    endif
  endif
  if(executable('ctags'))
    silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
  endif
  if(executable('cscope') && has("cscope") )
    if(MySys() == "unix")
      silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
    else
      silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
    endif
    silent! execute "!cscope -b"
    execute "normal :"
    if filereadable("cscope.out")
      execute "cs add cscope.out"
    endif
  endif
endfunction

 
" winmanager 1
"let g:winManagerWindowLayout="FileExplorer|TagList"
"nmap <F4> :WMToggle<cr>
" winmanager 2
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 30
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
" 用 F4 / C+F4 打开/关闭
nmap <F4> :WMToggle<cr>:q<cr>
nmap <F5> :WMClose<cr>
" 下面两句可以自动打开F4窗口
"au VimEnter * WMToggle
"au VimEnter * q



"<pre>
"set spellfile=~/.vim/spellfile.add
"set spelllang=en,en_us,ru
"set spell
"</pre>
"
"look CWORD info . look man: K
nnoremap <F1> :exe ":!info ".expand("<cword>")<ENTER>
map <right> <ESC>:MBEbn<RETURN>             
map <left> <ESC>:MBEbp<RETURN>              
"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W>   
"map <down> <ESC>:Tlist<RETURN>              
map <Leader>b :MiniBufExplorer<cr>
map <Leader>c :CMiniBufExplorer<cr>
map <Leader>u :UMiniBufExplorer<cr>
map <Leader>t :TMiniBufExplorer<cr>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapCTabSwitchWindows = 1
map <C-Tab> :bn<CR>  "切换Buffer，右切换
map <S-Tab> :bp<CR>  "切换Buffer，左切换

map fuck :call AddAuthor():$o
function AddAuthor()
    call setline(1,"#****************************************************")
    call append(1,"#  Author: Liangzi - com")
    call append(2,"#  " . "Last modified: " . strftime("%Y-%m-%d %H:%M"))
    call append(3,"#  Filename: " . expand("%"))
    call append(4,"#  Description: ")
    call append(5,"#****************************************************")
endfunction

"自动注释
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param  "
let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="----------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------"
let g:DoxygenToolkit_authorName="Liangzige...@gmail.com"
let s:licenseTag = "\<enter>Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

  
""""""""""""""""""""""""""""""
" List Directory ( netrw )
""""""""""""""""""""""""""""""
let g:netrw_winsize = 25
nmap <silent><Leader>fe :Sexplore!<cr>


"""""""""""""""""""""""""""""
" Zen Coding
"let g:user_zen_settings = {
"\  'php' : {
"\    'extends' : 'html',
"\    'filters' : 'c',
"\  },
"\  'xml' : {
"\    'extends' : 'html',
"\  },
"\  'haml' : {
"\    'extends' : 'html',
"\  },
"\}
let g:user_zen_expandabbr_key = '<C-j>'
let g:use_zen_complete_tag = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   HELP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" %  -> 匹配括号
" [[ -> 跳到代码块的开头去( {须独占一行 )
" gD -> 跳到局部变量的定义处
" ’’ -> 跳到光标上次停靠地方
" <C-f> -> 下一页
" <C-b> -> 上一页
" gg=G  -> 序列化内容
" <F4> -> 打开左侧目录结构
" <F5> -> 关闭左侧目录结构
"
" u     -> undo
" <C-r> -> redo
"
" >> -> 增加缩进 
" << -> 减少缩
" x> -> 表示增加x行缩进

" <C-n> -> 自动完成-跳到下一个
" <C-p> -> 自动完成-跳到上一个

" 删除
" ci[ 删除一对 [] 中的所有字符并进入插入模式
" ci( 删除一对 () 中的所有字符并进入插入模式
" ci< 删除一对 <> 中的所有字符并进入插入模式
" ci{ 删除一对 {} 中的所有字符并进入插入模式
" cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
" ci" ci' ci` 删除一对引号字符中所有字符并进入插入模式
" caX 删除文本，包含边界
" viX 则选中文本，不包含边界
" vaX 则选中文本，包含边界


"""""""""""""""
"     书签     
"""""""""""""""
" m[a-zA-Z] -> 设置书签
" '[a-zA-Z] -> 跳转到书签处
" '0 -> 跳转入现在编辑的文件中上次退出的位置 (go to last exit in file)
" '' -> 跳转如最后一次跳转的位置 (go to last jump -> go back to last jump)
" '" -> 跳转至最后一次编辑的位置 (go to last edit)

"""""""""""""""
"     寄存器
"""""""""""""""
" :reg -> 显示所有寄存器中的内容
" "[a-zA-Z]p -> 将某个寄存的内容贴出来
" "[a-zA-z]y -> 把信息复制到某个寄存中
"            如 "ayy 就复制了一行在寄存a中，
"               "byw 复制一个词在寄存b中
" "*y -> 这个是把信息复制进系统的复制版（可以在其他程序中贴出来）
" "*p -> 从系统的剪贴板中读取信息贴入vim.


"""""""""""""""
"      Tags      
"""""""""""""""
" tags | exuberant-ctags | http://ctags.sourceforge.net
" ctags -R "Create ctags file
" :tags -> 显示所有标志
" :ta :ts  ->
" <F3>  -> Tlist 左侧tag回车跳至源码处/空格显示完整写法
" <C-]> -> 跟着link/tag转入
" <C-o> -> 回到上一次jump
" <C-i> -> 跳回下一个
" :ju   -> 显示所有可跳跃的地方


"""""""""""""""
"     特殊字符(unicode) 
"""""""""""""""
" <C-v 273> -> ÿ
" <C-v-B>   -> ^B

"""""""""""""""
"    文件格式    
"""""""""""""""
" :set ff?  -> 检查当前文件格式
" :set ff=unix / dos -> 设置文件格式

"""""""""""""""
"     MiniBUF    
"""""""""""""""
" :bn :bp 左右切换
" :b1 :b2 切换到指定ID的文件
" miniBuf: <C-w,h j k l>
" a.vim : A AS...在c中转换c\h文件
"
" <Leader> : \
" <silent> : 不在命令行里回显
"
" Omni html/css/.../complete

"""""""""""""""
"   Emmet(zencoding)
"""""""""""""""
" :help zencoding
" html:5  <C-Y>,

"""""""""""""""
"      Dox (受filetype indent on影响，如PHP)
"""""""""""""""
" Dox DoxLic DoxAuthor
"""""""""""""""
"      PHP注释
"""""""""""""""
" <C-P> (php-doc)
"""""""""""""""
"      PHP文档
"""""""""""""""
" <K> (大写K)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
