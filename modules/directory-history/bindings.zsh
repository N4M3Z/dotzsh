##
#  @file
#      directory-history/bindings.zsh
#
#  @brief
#      Directory-history key bindings.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Bind up/down arrow keys to navigate through your history
bindkey '\e[A' directory-history-search-backward
bindkey '\e[B' directory-history-search-forward

# Bind CTRL+k and CTRL+j to substring search
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
