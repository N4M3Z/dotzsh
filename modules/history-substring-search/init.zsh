##
# Integrates history-substring-search into Prezto.
#
# Authors:
#     Suraj N. Kurapati <sunaku@gmail.com>
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <martin.zeman@protonmail.com>
#

# Load dependencies.
dotzsh-module-load 'editor'
dotzsh-module-load 'helper'

# Source module files.
zplug "zsh-users/zsh-history-substring-search", \
    as:plugin, \
    on:"zsh-users/zsh-syntax-highlighting", \
    defer:3, \
    hook-load:"source ${0:h}/config.zsh"
