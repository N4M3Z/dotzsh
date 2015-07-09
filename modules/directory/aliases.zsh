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

##
# Aliases
#

## Directory operations
#alias ..="cd .." # handled by auto_cd
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

alias lh="ls -hGFC"  # human readable, colorized, show file type, multi-column (default)
alias ll="ls -hGFl"  # human readable, colorized, show file type, long list
alias la="ls -hGFlA" # human readable, colorized, show file type, long list, show almost all (ignores .,.. etc.)
alias lr="ls -hGFtR" # human readable, colorized, show file type, sorted by date, recursive
alias lt="ls -hGFtl" # human readable, colorized, show file type, sorted by date, long list
alias lS="ls -1GFSs" # one entry per line, colorized, show file type, sorted by size, show blocksize occupied

alias dir="ls -hGlAC"     # human readable, colorized, long list, show almost all, multi-column (default)
alias ldot="ls -hGFld .*" # human readable, colorized, show type, long list, directories listed as plain files, only entries starting with a "." are shown

alias lrt="ls -1GFcrt"    # one entry per line, colorized, show type, status change time, reverse sort order, sorted by date
alias lart="ls -1GFcrta"  # one entry per line, colorized, show type, status change time, reverse sort order, sorted by date, show almost all

# OS X built-in ls command does not take time formatting arguments
if ! is-osx
then
    alias isols='ll --time-style=long-iso' # human readable, colorized, show type, long list, ISO timestamp
fi

# Safety first
alias rm="nocorrect rm -i"
alias cp="nocorrect cp -i"
alias mv="nocorrect mv -i"

alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

alias del="rm -i"
alias md="mkdir -p"
alias rd="rmdir"
