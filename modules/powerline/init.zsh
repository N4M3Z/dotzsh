#!/bin/zsh

##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Fish-like fast/unobtrusive autosuggestions for zsh (from tarruda/zsh-autosuggestions)
#
#  @author
#     Martin Zeman <https://github.com/N4M3Z>
#
#  @note
#     Must be loaded after zsh-syntax-highlighting
#

## Source module files.
source "${0:h}/external/powerline/bindings/zsh/powerline.zsh" || return 1

if is-defined 'powerline-daemon'; then
    powerline-daemon -q
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
fi
