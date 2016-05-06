# vimbox
vim configuration &amp; plugin.

### 文件说明
 - INSTALL.sh : vim插件安装脚本
 - parser.php : install.sh里php插件用到的脚本
 - .vimrc : ~/.vimrc
 - PluginPackage : 插件包
 - README.md : readme

### 安装方法
INSTALL.sh支持install和update操作；执行 INSTALL.sh 之前，找到如下配置(=1表示开启此功能或插件，＝0表示关闭):
```sh
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
```
配置完成后，运行INSTALL.sh安装：
```sh
$ ./INSTALL.sh
```

### 使用说明
INASTALL.sh 和 .vimrc 文件均有注释，在 .vimrc 底部包含有简单的说明和插件使用方法。

### VIM工具盒说明
这个配置工具是几年前的了，目前一直在用。 $./INSTALL.sh update 会通过 github 更新插件到最新版本，但不能保证更新之后配置文件有效或无bug（自行阅读新版本help修正）。
