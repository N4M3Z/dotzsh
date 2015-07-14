##
#  @file
#     fasd/aliases.zsh
#
#  @brief
#     Defines aliases for fasd module
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.ch>
#

# Default aliases from fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# User aliases
alias j='fasd_cd -i'     # Changes the current working directory interactively.

alias e='f -e subl'      # quick opening files with vim
alias m='f -e mplayer'   # quick opening files with mplayer
