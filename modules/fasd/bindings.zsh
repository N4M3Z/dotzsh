##
#  @file
#     fasd/bindings.zsh
#
#  @brief
#     Defines bindings for fasd module
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.ch>
#

bindkey '\C-k\C-a' fasd-complete    # [ctrl + k, ctrl + a] to do fasd-complete (files and directories)
bindkey '\C-k\C-f' fasd-complete-f  # [ctrl + k, ctrl + f] to do fasd-complete-f (only files)
bindkey '\C-k\C-d' fasd-complete-d  # [ctrl + k, ctrl + d] to do fasd-complete-d (only directories)
