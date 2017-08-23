"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 基本配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
""" Pathogen
"execute pathogen#infect()
"call pathogen#helptags()
syntax on
filetype plugin indent on    " required


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
" max gvim
if MySys() == "win32"
    if has("autocmd")
        au GUIEnter * simalt ~x
    endif
else
    function Maximize_Window()
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction
endif

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

" 自动切换当前目录
set autochdir
" 设置历史命令列表长度
"set history=50
" 显示输入的命令
set showcmd
" 关闭兼容 vi
set nocompatible
" 设置swp目录(mkdir ~/.vimswp)
set directory=~/.vimswp

" 高亮搜索
set hlsearch
" 增量搜索
set incsearch
" 搜索时忽略大小写，但如果搜索词包含大写则不忽略
"set ignorecase smartcase
" 一个Tab键缩进4格
set tabstop=4
" 缩进4格
set shiftwidth=4
" 缩进格式(根据语言自定义)
au FileType html,vim,javascript,tpl,twig setl shiftwidth=2
au FileType html,vim,javascript,tpl,twig setl tabstop=2
au FileType c,java,php,python setl shiftwidth=4
au FileType c,java,php,python setl tabstop=4
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
"set ic "ignore case
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
"inoremap jj <ESC> 
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

" 光标行样式
"set cursorcolumn
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"set cursorline
"highlight CursorLine cterm=NONE ctermbg=lightgray ctermfg=NONE guibg=NONE guifg=NONE
