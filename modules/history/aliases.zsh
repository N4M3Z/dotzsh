#!/bin/zsh

##
# @file
#      history.module.zsh
#
# @brief
#      Sets history options and defines history aliases.
#
# @authors
#      Robby Russell <robby@planetargon.com>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman  <https://github.com/N4M3Z>

##
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

##
# Functions
#
function zsh-history-edit()
{
    ${EDITOR} ${HISTFILE}
}

# Lists 20 most used commands.
function zsh-history-stats()
{
    fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

##
# Aliases
#
#alias history='fc -l 1' # aliased in ZSH by default
case $HIST_STAMPS in
    "mm/dd/yyyy") alias history='fc -fl 1' ;;
    "dd.mm.yyyy") alias history='fc -El 1' ;;
    "yyyy-mm-dd") alias history='fc -il 1' ;;
    *) alias history='fc -l 1' ;;
esac

alias hgrep="history | grep"
alias hgrepi="hgrep -i"
alias hedit="zsh-history-edit"
alias hstat="zsh-history-stats"
