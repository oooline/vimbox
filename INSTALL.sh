#!/bin/sh 

# 此脚本负责部署和升级，通过 【args】控制 :install  :update

if [ $# != 1 ]; then
 echo 'Useage: INSTALL.sh install/update'
 exit
fi

x=0
if [ $1 = install ]; then
    x=1
fi
if [ $1 = update ]; then
    x=2
fi
if [ $x = 0 ]; then
 echo 'Useage: INSTALL.sh install/update'
 exit
fi

#配置插件加载
pathogen=1 #插件管理A 
Bundle=0   #插件管理B 安装依赖Git
emmet=1
neocomplcache=1
a=1
c=0  #安装之后打开vim会卡顿
phpdoc=1
phphelp=1
bufexplorer=1
DoxygenToolkit=1
MiniBufExplorer=1
NERD_tree=1
Taglist=1
winmanager=1
Ctags=1
Cscope=1

dir=`pwd`
zip=$dir/PluginPackage

echo '开始安装......';

#pathogen
# - https://github.com/tpope/vim-pathogen
# - 插件管理
if [ $pathogen = 1 ]; then
    file=$zip/pathogen.vim
    if [ $x = 1 ]; then
    	mkdir -p ~/.vim/autoload  ~/.vim/bundle 
    	cp $file ~/.vim/autoload/
        echo '                       ---> ~/.vimrc 添加  call pathogen#infect()'
        echo '                       ---> ~/.vimrc 添加  call pathogen#helptags()'
    fi
    if [ $x = 2 ]; then
    	curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    fi
fi

#Bundle
# - https://github.com/gmarik/vundle.git
# - 插件管理
if [ $Bundle = 1 ]; then
    file=vundle
    if [ $x = 1 ]; then
    	mkdir -p ~/.vim/bundle
    	cp -a $zip/$file ~/.vim/bundle/
        echo '                       ---> ~/.vimrc 添加  call vundle#rc() 等...'
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf $file
    	git clone https://github.com/gmarik/vundle.git
    	cd -
    fi
fi


#emmet
# - https://github.com/mattn/emmet-vim
# - http://www.vim.org/scripts/script.php?script_id=2981
# - 原zencodding插件，方便补齐代码. 如  html:5  <C-Y>,
if [ $emmet = 1 ]; then
    file=$zip/emmet-vim
    if [ $x = 1 ]; then
    	cp -a $file ~/.vim/bundle/
    	echo '                       ---> ~/.vimrc 添加  Bundle "mattn/emmet-vim"'
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf emmet-vim
    	git clone https://github.com/mattn/emmet-vim.git
    	cd -
    fi
fi

#neocomplcache
# - http://www.vim.org/scripts/script.php?script_id=2620
# - https://github.com/Shougo/neocomplcache.vim/tree/master
# - 自动补全插件
if [ $neocomplcache = 1 ]; then
    file=$zip/neocomplcache.vim
    if [ $x = 1 ]; then
    	cp -a $file ~/.vim/bundle/
    	echo '                       ---> ~/.vimrc 添加 let g:neocomplcache_enable_at_startup = 1'
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf neocomplcache.vim
    	git clone https://github.com/Shougo/neocomplcache.vim.git
    	cd -
    fi
fi

#a.vim
# - http://www.vim.org/scripts/script.php?script_id=31
# - 切换文件，如在.h和.c之间切换
if [ $a = 1 ]; then
    file=$zip/a.vim
    if [ $x = 1 ]; then
        mkdir -p ~/.vim/plugin
    	cp $file ~/.vim/plugin/
    fi
fi
#c.vim
# - http://www.vim.org/scripts/script.php?script_id=213
# - C
if [ $c = 1 ]; then
    file=$zip/cvim
    if [ $x = 1 ]; then
	    cp -a $file ~/.vim/bundle/
    fi
fi
#phpdoc
# - http://www.vim.org/scripts/script.php?script_id=1355
# - 添加PHP注释 <C+P>
# - if : tags file not sorted
# - 打开phpmanual/doc/tags, :%sort
if [ $a = 1 ]; then
    file=$zip/php-doc.vim
    if [ $x = 1 ]; then
        mkdir -p ~/.vim/plugin
    	cp $file ~/.vim/plugin/
    fi
fi
#phphelp
# - PHP VIM 帮助文档  <K>
# - 下载或自己生成文档
# - A. #paer install XML_Parser
# - B. wget http://blog.planetxml.de/uploads/source/php/phpdoc/parser2.php.txt -O parser.php
# - C. svn co http://svn.php.net/repository/phpdoc/modules/doc-en  OR  doc-zh
# - D. mkdir out  & touch out/tags
# - D. php parser.php (修改文件的路径)
# - *. 注意重新执行parser tags会被覆盖！
if [ $phphelp = 1 ]; then
    file=phpdoc
    if [ $x = 1 ]; then
	    cp -a $zip/$file ~/.vim/
    fi
fi



#bufexplorer
# - http://www.vim.org/scripts/script.php?script_id=42
# - https://github.com/vim-scripts/bufexplorer.zip.git
# - 打开历史文件记录，试试  :\be  \bs  \bv
if [ $bufexplorer = 1 ]; then
    file=$zip/bufexplorer.zip
    if [ $x = 1 ]; then
	    cp -a $file ~/.vim/bundle/
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf bufexplorer.zip
	    git clone https://github.com/vim-scripts/bufexplorer.zip.git
    	cd -
    fi
fi


#DoxygenToolkit
# - http://www.vim.org/scripts/script.php?script_id=987
# - https://github.com/vim-scripts/DoxygenToolkit.vim
# - 自动注释，自定义函数
# - :DoxLic 添加许可
# - :DoxAuthor 添加作者
# - :Dox 函数开头位置注释
# - :更多用法查看HELP，可以结合doxygen自动生成各种格式的文档
if [ $DoxygenToolkit = 1 ]; then
    file=$zip/DoxygenToolkit.vim
    if [ $x = 1 ]; then
	    cp -a $file ~/.vim/bundle/
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf DoxygenToolkit.vim
	    git clone https://github.com/vim-scripts/DoxygenToolkit.vim
    	cd -
    fi
fi


#MiniBufExplorer
# - https://github.com/fholgado/minibufexpl.vim.git
# - http://www.vim.org/scripts/script.php?script_id=159
# - 顶部显示的窄小多文件列表
if [ $MiniBufExplorer = 1 ]; then
    file=minibufexpl.vim
    if [ $x = 1 ]; then
	    cp -a $zip/$file ~/.vim/bundle/
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf $file
	    git clone https://github.com/fholgado/minibufexpl.vim.git
    	cd -
    fi
fi


#NERD_tree
# - https://github.com/scrooloose/nerdtree
# - 目录浏览，当前配置快捷键：F3 F4
if [ $NERD_tree = 1 ]; then
    file=nerdtree
    if [ $x = 1 ]; then
	    cp -a $zip/$file ~/.vim/bundle/
    fi
    if [ $x = 2 ]; then
        echo ' '
    	cd ~/.vim/bundle
        rm -rf $file
	    git clone https://github.com/scrooloose/nerdtree.git
    	cd -
    fi
fi


#Taglist
# - http://www.vim.org/scripts/script.php?script_id=273
# - 基于ctags分割显示代码结构
if [ $Taglist = 1 ]; then
    file=taglist_46
    if [ $x = 1 ]; then
	    cp -a $zip/$file ~/.vim/bundle/
    fi
fi


#winmanager.vim
# - http://www.vim.org/scripts/script.php?script_id=95
# - 文件浏览&窗口管理
if [ $winmanager = 1 ]; then
    file=winmanager
    if [ $x = 1 ]; then
	    cp -a $zip/$file ~/.vim/bundle/
    fi
fi




#Ctags
# - 使用 $ctags -R 递归生成目录树的tags文件
if [ $Ctags = 1 ]; then
    if [ $x = 1 ]; then
    	echo '                       ---> 需要安装 ctags 如：apt-get or yum'
    fi
    if [ $x = 2 ]; then
    	echo '                       ---> 尝试升级 ctags 如：apt-get or yum'
    fi
fi


#Cscope 
# - 交互式代码跳转工具，需生成cscope文件
if [ $Cscope = 1 ]; then
    if [ $x = 1 ]; then
    	echo '                       ---> 需要安装 cscope 如：apt-get or yum'
    fi
    if [ $x = 2 ]; then
    	echo '                       ---> 尝试升级 cscope 如：apt-get or yum'
    fi
fi


echo ' '
echo ' '
echo '--- 未安装插件 ---'
echo 'Syntastic : 语法错误检查(https://github.com/scrooloose/syntastic)'
echo ' '
echo ' '


echo '--- 配置~/.vimrc ---'
if [ -f ~/.vimrc ]; then
    #df=`diff ~/.vimrc $dir/_.vimrc > /dev/null`
    diff ~/.vimrc $dir/_.vimrc > /dev/null
    if [ $? = 0 ];then
        echo '已配置成功'
    else
        echo '~/.vimrc 已存在，请手动复制:_.vimrc'
    fi
else
    cp $dir/_.vimrc ~/.vimrc
    echo '配置成功'
fi

echo ' '
echo ' '
echo '安装完成'
echo '开启您的VIM之旅...'
