##
#  @file
#      directory/aliases.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      James Cox <james@imaj.es>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <https://github.com/N4M3Z>
#

# Load dependencies.
dotzsh-module-load "helper"

## Directory operations
#alias ..="cd .."     # handled by auto_cd
#alias ...="cd ../.." # handled by auto_cd
alias -- -="cd -"

# alias 1="cd -"
# alias 2="cd -2"
# alias 3="cd -3"
# alias 4="cd -4"
# alias 5="cd -5"
# alias 6="cd -6"
# alias 7="cd -7"
# alias 8="cd -8"
# alias 9="cd -9"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

## Push and pop directories on directory stack
alias d="dirs -v | head -10" # prints the contents of the directory stack.
alias pu="pushd"
alias po="popd"

# Safety first
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias rmdir="${aliases[rmdir]:-rmdir} -v"
alias chmod="${aliases[chmod]:-chmod} -v"
alias chown="${aliases[chown]:-chown} -v"

# ls
if is-callable 'dircolors'; then
    # GNU Core Utilities
    alias ls='ls --group-directories-first'

    if zstyle -t ':dotzsh:module:utility:ls' color; then
        if [[ -s "$HOME/.dir_colors" ]]; then
            eval "$(dircolors --sh "$HOME/.dir_colors")"
        else
            eval "$(dircolors --sh)"
        fi

        alias ls="${aliases[ls]:-ls} --color=auto"
    else
        alias ls="${aliases[ls]:-ls} -F"
    fi
else
    # BSD Core Utilities
    if zstyle -t ':dotzsh:module:utility:ls' color; then
        # Define colors for BSD ls.
        export LSCOLORS='exfxcxdxbxGxDxabagacad'

        # Define colors for the completion system.
        export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

        alias ls="${aliases[ls]:-ls} -G"
    else
        alias ls="${aliases[ls]:-ls} -F"
    fi
fi

alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.

alias dir="ls -hGlAC"     # human readable, colorized, long list, show almost all, multi-column (default)
alias ldot="ls -hGFld .*" # human readable, colorized, show type, long list, directories listed as plain files, only entries starting with a "." are shown

# Creates a directory and then changes to it. Defined in functions.
alias take="mkdcd"
