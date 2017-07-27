##
#  @file
#      blackbox/init.zsh
#
#  @brief
#      Integrates StackExchange/blackbox.
#
#  @author
#      Martin Zeman <https://github.com/N4M3Z>
#

# Source module files.
zplug "StackExchange/blackbox", \
    as:plugin, \
    hook-load:"source ${0:h}/config.zsh"
