##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Fish-like fast/unobtrusive autosuggestions for zsh (from tarruda/zsh-autosuggestions)
#
#  @author
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <martin.zeman@protonmail.ch>
#
#  @note
#     Must be loaded after zsh-syntax-highlighting
#

# Load dependencies.
dotzsh-module-load 'editor'

# Source module files.
zplug "zsh-users/zsh-autosuggestions", \
    use:zsh-autosuggestions.zsh, \
    on:"zsh-users/zsh-syntax-highlighting", \
    on:"zsh-users/zsh-history-substring-search", \
    defer:3, \
    hook-load:"source ${0:h}/config.zsh"
