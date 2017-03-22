
##################################################################
#------------------ ~/.bashrc
#------------------ ~/.bash_profile (mac)

#alias rm='rm -iv'
#alias mv='mv -iv' #i
#alias cp='cp -iv'

# history
#HISTFILESIZE=2000
#HISTSIZE=2000
#HISTTIMEFORMAT="%Y%m%d-%H%M%S: "
#export HISTTIMEFORMAT
#export HISTTIMEFORMAT="%F %T "

#mount -t cifs //10.0.0.15/Codes -o username=leon,password=pass,uid=leon,gid=leon,dir_mode=0755 /var/www/WinCodes/ 
#awk 'BEGIN { cmd="cp -i a a1"; print "n" |cmd; }
#yes no| cp -iR cp1/* cp2

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# log
HISTFILE=/root/.bash_history_for_user

# c/php
alias phptags='ctags --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php'
#ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .
#ctags -R --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf /usr/include/*

# alias
export EDITOR="vim"
alias vi='vim'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# for mac
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

