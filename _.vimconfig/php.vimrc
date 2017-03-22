"""" PHP
inoremap phps <?php<CR>?><ESC>ko
"    iab phps <?php<CR>?><ESC>ko

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

