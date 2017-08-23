#!/bin/bash 

# vim安装升级脚本

if [ $# != 1 ]; then
 echo 'Useage: INSTALL.sh install/update'
 exit
fi
if [ $1 = install ]; then
    echo '+-- Install Plugin'
elif [ $1 = update ]; then
    echo '+-- Update Plugin'
else
    echo 'Useage: INSTALL.sh install/update'
    exit
fi

if [ -f ~/.vimrc ]; then
    read -n1 -p "[~/.vimrc] already exists. Press any key to continue (y/n) : "
    if [ "$REPLY" != 'y' ]; then
      echo "$REPLY"
      echo ""
      exit
    fi
    echo ""
fi
if [ -f ~/.ctags ]; then
    read -s -n1 -p "[~/.ctags] already exists. Press any key to continue (y/n) : "
    if [ "$REPLY" != 'y' ]; then
      echo "$REPLY"
      echo ""
      exit
    fi
    echo ""
fi

cp _.vimrc ~/.vimrc
cp _.ctags ~/.ctags
if [ ! -d ~/.vimswp ]; then
    mkdir ~/.vimswp
fi
if [ ! -d ~/.vimconfig ]; then
    mkdir ~/.vimconfig
fi
cp _.vimconfig/* ~/.vimconfig/


vim=~/.vim
if [ $1 = install ]; then
    if [ ! -d $vim/autoload ]; then
        echo "+-- mkdir $vim/..."
        mkdir -p $vim/autoload
        mkdir -p $vim/bundle
    fi
fi

# 插件安装
do=$1
inup() {
    echo -e "\n"
    echo +-- Plugin : $1
    gitname=`echo ${2##*/} | cut -d "." -f1`
    vimbin="$vim/bundle/$gitname"
    if [ $do = install ]; then
    	if [ -d "$vimbin" ]; then
    	    cd "$vimbin"
    	    git pull
        else
            cd $vim/bundle
            git clone $2 "$vimbin"
    	fi
    fi
    if [ $do = update ]; then
        cd "$vimbi"
        git pull
    fi
    echo -e "\n"
}
# 字体安装
setfont() {
    if [ ! -d ./fonts ]; then
        mkdir ./fonts
    fi
    if [ ! -f "./fonts/${1}" ]; then
        curl -fLo "./fonts/${1}" $2 
        if [ $? -gt 0 ]; then
            echo -e '\033[01;31m'字体文件下载失败.'\033[00m'
        fi
    fi
    # Set source and target directories
    powerline_fonts_dir=$( cd "$( dirname "$0" )" && pwd )
    
    find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"
    
    if [[ `uname` == 'Darwin' ]]; then
      # MacOS
      font_dir="$HOME/Library/Fonts"
    else
      # Linux
      font_dir="$HOME/.local/share/fonts"
      mkdir -p $font_dir
    fi
    
    # Copy all fonts to user fonts directory
    echo "Copying fonts..."
    eval $find_command | xargs -0 -I % cp "%" "$font_dir/"
    
    # Reset font cache on Linux
    if command -v fc-cache @>/dev/null ; then
        echo "Resetting font cache, this may take a moment..."
        fc-cache -f $font_dir
    fi
    
    echo "All Powerline fonts installed to $font_dir"
    echo -e '\033[01;31m'若您使用Terminal连接远程vim, 则Terminal同样需支持Poweroline字体.'\033[00m'
    echo $2
    echo ''
    echo ''
}

#目录浏览
#inup Nerdtree http://github.com/scrooloose/nerdtree.git


#pathogen
# - 插件管理
# - https://github.com/tpope/vim-pathogen
#echo +-- Plugin : Pathogen
#curl -LSso $vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


#插件管理(Update)
####inup Vundle https://github.com/VundleVim/Vundle.vim.git
####vim +PluginInstall +qall


#安装状态栏插件airline需要的字体
#https://github.com/powerline/fonts.git
#https://github.com/ryanoasis/nerd-fonts.git
echo "+-- airline : Font(otf)"
setfont "Code New Roman Nerd Font Complete Mono.otf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/CodeNewRoman/complete/Code%20New%20Roman%20Nerd%20Font%20Complete%20Mono.otf"
# / Anonymice Pro
# / Code New Roman
# / Roboto Mono (Light)  
# / Source Code Pro
# / Sauce Code Powerline 
# / Courier New
# / Ubuntu Mono

echo "+-- YouCompleteMe"
#https://github.com/Valloric/YouCompleteMe#installation
echo -e '\033[01;31m'Install: https://github.com/Valloric/YouCompleteMe#installation.'\033[00m'
if [[ `uname` != 'Darwin' ]]; then
    #echo 'cd ~/.vim/bundle/YouCompleteMe/'
    #echo './install.py --clang-completer --tern-completer'
    #echo ''
echo '---
$ vim --version #确保vim支持:python2/3
$ apt-get install llvm-3.* clang-3.* libclang-3.*-dev libboost-all-dev
$ mkdir ~/.ycm_build && cd ~/.ycm_build
$ cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#编译结果: Using external libclang...指定的不是最新库, 删除此目录已生成的所有文件, 指定so, 重新cmake.
$ cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DEXTERNAL_LIBCLANG_PATH=/~lib~/libclang-3.9.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
$ cmake --build . --target ycm_core
'
fi

echo "$ cat _.bashrc >> ~/.bashrc && source ~/.bashrc"

