#!/bin/zsh

##
#  @file
#      trash/init.zsh
#
#  @brief
#      Aliases for the *trash* plugin (see [link](https://github.com/sindresorhus/trash)sindresorhus/trash)
#
#  @authors
#      sindresorhus <https://github.com/sindresorhus>
#      N4M3Z <https://github.com/N4M3Z>
#
alias t=trash

# Safety first according to: https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
alias rm="nocorrect rm -i"
alias cp="nocorrect cp -i"
alias mv="nocorrect mv -i"

alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

alias del="rm -i"
alias md="mkdir -p"
alias rd="rmdir"
