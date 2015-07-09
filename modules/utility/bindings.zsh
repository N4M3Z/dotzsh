#!/bin/zsh

##
#  @file
#     utility/bindkey.zsh
#
#  @brief
#     Directory key bindings
#
#  @author
#     Martin Zeman <https://github.com/N4M3Z>
#

# [esc + space] - run command: cd ..
zle -N parent-dir
bindkey '\e ' parent-dir # [esc + space]

# [esc + enter] : print Git/Svn status or list files with ls
zle -N ls-status
bindkey '\e\r' ls-status # [esc + enter]
bindkey '\M\r' ls-status # [alt + enter]
