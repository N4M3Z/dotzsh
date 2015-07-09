##
#  @file
#      wordchar/bindings.zsh
#
#  @brief
#      Z-Shell character skipping using extended wordchars
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

bindkey '\e[1;9A' backward-to-space # [alt + up]
bindkey '\e[1;9B' forward-to-space  # [alt + down]

bindkey '\C-f' forward-to-slash  # [ctrl + f] replaces forward-word
bindkey '\C-b' backward-to-slash # [ctrl + b] replaces backward-word

bindkey '\e[1;9C' forward-to-slash  # [alt + left]  replaces forward-word
bindkey '\e[1;9D' backward-to-slash # [alt + right] replaces forward-word
