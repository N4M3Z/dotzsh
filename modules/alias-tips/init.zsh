##
#  @file
#       alias-tips/init.zsh
#
#  @brief
#       Integrates djui/alias-tips.
#
#  @author
#       Martin Zeman <martin.zeman@protonmail.com>
#

# Source module files.
zplug "djui/alias-tips", \
    use:alias-tips.plugin.zsh, \
    hook-load:"source ${0:h}/config.zsh"
