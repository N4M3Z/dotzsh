##
#  @file
#      init.zsh
#
#  @brief
#      ZSH URL Highlighter
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Source module files.
zplug "ascii-soup/zsh-url-highlighter", \
    use:url/url-highlighter.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:2
