# .zshrc

function precmd {
    setopt +o nomatch

    local __last_cmd_RC=$?
    local __last_cmd_return_code=""
    if [ $__last_cmd_RC -eq 0 ]; then
         __last_cmd_return_code="%{%B%F{green}%}$__last_cmd_RC"
    else
         __last_cmd_return_code="%{%B%F{red}%}$__last_cmd_RC"
    fi

    if test -z "$VIRTUAL_ENV" ; then
        __python_virtualenv=""
    else
        __python_virtualenv="%{%B%F{white}%}[`basename \"$VIRTUAL_ENV\"`] "
    fi

    local __timestamp="%{%B%F{yellow}%}%*"
    local __user_and_host="%{%B%F{green}%}%n@%m"
    local __cur_location="%{%B%F{blue}%}%~"
    local __git_branch_color="%{%B%F{red}%}"
    local __git_branch="`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ / 2> /dev/null`"
    local __prompt_tail="%{%B%F{magenta}%}$"
    local __last_color="%{%f%b%}"
    export PS1="$__python_virtualenv$__timestamp $__last_cmd_return_code $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -i
fi

alias ls='ls -G'
alias hgrep='history | grep'

export EDITOR=vim
