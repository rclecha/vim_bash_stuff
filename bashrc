# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias ls='ls -G'
alias hgrep='history | grep'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin:/Applications/ti/uniflash_4.3.1"

export EDITOR=vim
