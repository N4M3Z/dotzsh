#!/bin/zsh

##
# @file
#      history/functions.zsh
#
# @brief
#      Defin history options and defines history aliases.
#
# @authors
#      Robby Russell <robby@planetargon.com>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman  <martin.zeman@protonmailch>
#

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
