# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\H:\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"
    #export PS1="\n\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\H:\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"
    export PS1="\n\[\033[38;5;11m\]\u@\H:\[\033[38;5;14m\]\w\n\\$ \[\033[0m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export EDITOR="/usr/bin/vim"


# pratham

# set vi as the readline editor in bash
set -o vi

#general-aliases
alias myip='curl ifconfig.me; echo'
alias sp='source ~/.bashrc'
alias vp='vim ~/.bashrc'
alias wh='cd /mnt/c/Users/pss'
alias lg='ls | grep'
alias g='grep -i -E'

f()
{
    find . -iname "*$1*"
}

#git-start
alias gs='git status'
alias ga='git add'
alias gp='git pull'
alias gb='git branch'
alias gm='git checkout master'
alias gc='git checkout'
alias gout='git checkout -b'
alias gd='git diff master'
alias gdn='git diff master --name-only'
alias greb='git pull --rebase origin master'
alias gr='git checkout master && git fetch origin && git reset --hard origin/master && git clean -f -d'
alias gcm='git commit'
alias gl='git log'
alias gdm='git diff master --'
alias gpom='git push origin master'
alias gdiff='git difftool --tool=vimdiff'

gcr()
{
    git commit -m "$1"
}

rb()
{
    git checkout master
    printf "\n>refresh master\n"
    gr
    for i in $(git branch | cut -c 3-); do
        git checkout $i
        printf ">refreshing branch $i\n\n"
        greb
        echo
    done
    git checkout master
}
#git-end

alias vls='vim $(ls | fzf)'

# run update on apt-get supported distros
run_update()
{
    echo "Running sudo apt-get update && sudo apt-get upgrade -y"
    set -x
    sudo apt-get update && sudo apt-get upgrade -y
    set +x
}

ru()
{
    echo "Do you wish to update this system?";
    select input in "Yes" "No";
    do
        case $input in
            Yes)
                echo "Running sudo apt-get update && sudo apt-get upgrade -y";
                set -x;
                if sudo apt-get update && sudo apt-get upgrade -y; then
                    echo "Update successful."
                    if sudo apt-get autoremove -y && sudo apt-get autoclean -y; then
                        echo "Cleanup successful."
                    else
                        echo "Cleanup failed."
                    fi
                else
                    echo "Update failed."
                fi
                set +x;
                break
            ;;
            No)
                break
            ;;
        esac;
    done
}

# general purpose python3 -c eval
pyc()
{
    python3 -c "print("$1")"
}

# Generate random number
random() {
    n=$1
    head -c 4 /dev/urandom | od -An -N4 -i | awk -v n="$n" '{print $1 % n}'
}

rand_num() {
  local n=$1
  local random_num=$(openssl rand -hex 1 | tr -dc '0-9' | head -c 1)
  printf "${random_num}"
}

alias tls='tmux list-sessions'
alias tas='tmux attach-session -t'
alias news='python3 ~/news/news.py'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
