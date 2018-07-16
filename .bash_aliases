# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias la='ls -A --color=auto'
    alias ll='ls -Alh --color=auto'

    alias grep='grep --color=auto'
    alias rgrep='rgrep --color=auto'
else
    alias ls='ls -F'
    alias la='ls -FA'
    alias ll='ls -FAlh'
fi

alias g='git'
alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
alias h=home

# trusted vim; per-directory vimrc
alias tvim='vim -u .vimrc'
