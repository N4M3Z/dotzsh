#
# Integrates zsh-syntax-highlighting into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if ! zstyle -t ':dotzsh:module:syntax-highlighting' color; then
    return 1
fi

# Source module files.
zplug "zsh-users/zsh-syntax-highlighting", \
    as:plugin, \
    defer:2, \
    hook-load:"source ${0:h}/config.zsh"
