# only print if interactive
[ -z "$PS1" ] && return

export PS1='[ \[\e[0;32m\]\u@\h \[\e[0;35m\]`date "+%D %0l:%M %p"` \[\e[1;34m\]\W\[\e[m\] ]\[\e[1;32m\]\$\[\e[m\] '

/usr/bin/env cowsay "Welcome to $(hostname)"
