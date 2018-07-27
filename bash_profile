# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then 
    . ~/.bashrc
fi

##
# Your previous /Users/rlecha/.bash_profile file was backed up as /Users/rlecha/.bash_profile.macports-saved_2016-08-25_at_14:26:16
##

# MacPorts Installer addition on 2016-08-25_at_14:26:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function color_my_prompt {
    local __last_cmd_return_code=$?
    local __last_cmd_return_code_color=""
    if [ $__last_cmd_return_code -eq 0 ]; then
         __last_cmd_return_code_color="\[\033[01;32m\]"
    else
         __last_cmd_return_code_color="\[\033[01;31m\]"
    fi

    if test -z "$VIRTUAL_ENV" ; then
        __python_virtualenv=""
    else
        __python_virtualenv="\[\033[01;37m\][`basename \"$VIRTUAL_ENV\"`] "
    fi

    local __timestamp="\[\033[01;33m\]\t"
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\W"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ / 2> /dev/null`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__python_virtualenv$__timestamp $__last_cmd_return_code_color$__last_cmd_return_code $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

export PROMPT_COMMAND=color_my_prompt

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
