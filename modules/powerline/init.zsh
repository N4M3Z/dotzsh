##
#  @file
#     powerline/init.zsh
#
#  @brief
#     Module for PowerLine
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.ch>
#

## Source module files.
source "${0:h}/external/powerline/bindings/zsh/powerline.zsh" || return 1

if is-defined 'powerline-daemon'; then
    powerline-daemon -q
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
fi
