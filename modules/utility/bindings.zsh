#!/bin/zsh

##
#  @file
#     utility/bindings.zsh
#
#  @brief
#     Directory key bindings
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.ch>
#

# [esc + space] - run command: cd ..
zle -N dirup
bindkey '\e ' dirup # [esc + space]

# [esc + enter] : print Git/Svn status or list files with ls
zle -N lstatus
bindkey '\e\r' lstatus # [esc + enter]
bindkey '\M\r' lstatus # [alt + enter]
