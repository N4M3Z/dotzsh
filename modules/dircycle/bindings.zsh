##
# @file
#     dircycle/bindings.zsh
#
# @brief
#     Key bindings for directory stack cycling
#
# @author
#     Martin Zeman <https://github.com/N4M3Z>
#

zle -N insert-cycledleft
zle -N insert-cycledright

bindkey '\e[1;2D' insert-cycledleft  # [shift + left]
bindkey '\e[1;2C' insert-cycledright # [shift + right]
