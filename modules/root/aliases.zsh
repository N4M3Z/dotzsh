#!/bin/zsh

##
#  @file
#     root/alias.zsh
#
#  @brief
#     Alises for ROOT
#
#  @author
#     Martin Zeman <https://github.com/N4M3Z>
#
#  @note
#     Requires functioning installation of ROOT
#

## Aliases
alias root="root -l"

autoload -U is-at-least
if is-at-least 4.2.0 ; then
    # Suffix alias
    alias -s root=root -l
fi
