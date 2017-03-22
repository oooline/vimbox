""" Vundle
"Help(install)$vim:PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 插件管理
Plugin 'VundleVim/Vundle.vim'

" 代码补全
" html:5  <C-Y>,
Plugin 'mattn/emmet-vim'

" 文件搜索
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
" 目录浏览
Plugin 'scrooloose/nerdtree'
" 文件结构
Plugin 'majutsushi/tagbar'
" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" source ctrlp

" 自动对其[:Tab /=]
Plugin 'godlygeek/tabular'
" 多行编辑
"Plugin 'terryma/vim-multiple-cursors'

" 自动补全
Plugin 'Valloric/YouCompleteMe'

" PHPManual
Plugin 'alvan/vim-php-manual'

" Syntasic
Plugin 'vim-syntastic/syntastic'
" source syntastic
call vundle#end()            " required


"""'''''''''''''''''''''''''''''''''''''''''''''''''''''

" Base Config
source ~/.vimconfig/base.vimrc
" Leon's config
source ~/.vimconfig/leon.vimrc
" PHP
source ~/.vimconfig/php.vimrc
" Html(Js/css/...)
source ~/.vimconfig/html.vimrc
" ctrlp,nerdtree,tagbar,airline
source ~/.vimconfig/ctrlp.vimrc
" Syntastic
source ~/.vimconfig/syntastic.vimrc
" YouCompleteMe
source ~/.vimconfig/YouCompleteMe.vimrc


let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F7> :YcmDiags<CR>

" Enable omni completion.
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
"autocmd FileType html,markdown,twig setlocal omnifunc=htmlcomplete#CompleteTags 
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 


" PHP Manual
"     press SHIFT-k to view the Explanation of the keyword under the cursor
"     press CTRL-h to see the online manual of the keyword under the cursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   HELP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 部分插件的说明见其source文件
" %     -> 匹配括号
" [[    -> 跳到代码块的开头去( {须独占一行 )
" gD    -> 跳到局部变量的定义处
" ’’    -> 跳到光标上次停靠地方
" <C-f> -> 下一页
" <C-b> -> 上一页
" gg=G  -> 序列化内容
" <F4>  -> 打开左侧目录结构
" <F5>  -> 关闭左侧目录结构
"
" u     -> undo
" <C-r> -> redo
" <C-n> -> 自动完成-跳到下一个
" <C-p> -> 自动完成-跳到上一个
"
" >>    -> 增加缩进 
" <<    -> 减少缩
" x>    -> 表示增加x行缩进

" 删除
" ci[   删除一对 [] 中的所有字符并进入插入模式
" ci(   删除一对 () 中的所有字符并进入插入模式
" ci<   删除一对 <> 中的所有字符并进入插入模式
" ci{   删除一对 {} 中的所有字符并进入插入模式
" cit   删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
" ci" ci' ci` 删除一对引号字符中所有字符并进入插入模式
" caX   删除文本，包含边界
" viX   则选中文本，不包含边界
" vaX   则选中文本，包含边界

"""""""""""""""
"     YouCompleteMe     
"""""""""""""""
" <C+x+o>
"
"""""""""""""""
"     PHP     
"""""""""""""""
" 项目目录: $ phptags -R
" 使用方法: Jump<C+]> Back<C+t/o>

"""""""""""""""
"     书签     
"""""""""""""""
" m[a-zA-Z] -> 设置书签
" '[a-zA-Z] -> 跳转到书签处
" '0        -> 跳转入现在编辑的文件中上次退出的位置 (go to last exit in file)
" ''        -> 跳转如最后一次跳转的位置 (go to last jump -> go back to last jump)
" '"        -> 跳转至最后一次编辑的位置 (go to last edit)

"""""""""""""""
"     寄存器
"""""""""""""""
" :reg       -> 显示所有寄存器中的内容
" "[a-zA-Z]p -> 将某个寄存的内容贴出来
" "[a-zA-z]y -> 把信息复制到某个寄存中
"            如 "ayy 就复制了一行在寄存a中，
"               "byw 复制一个词在寄存b中
" "*y        -> 这个是把信息复制进系统的复制版（可以在其他程序中贴出来）
" "*p        -> 从系统的剪贴板中读取信息贴入vim.


"""""""""""""""
"     特殊字符(unicode) 
"""""""""""""""
" <C-v 273>  -> ÿ
" <C-v-B>    -> ^B

"""""""""""""""
"    文件格式    
"""""""""""""""
" :set ff?   -> 检查当前文件格式
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

"   HELP END '''''''''''''''''''''''''''''''''''''''''''
