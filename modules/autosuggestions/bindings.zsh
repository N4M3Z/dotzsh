##
#  @file
#     autosuggestions/bindings.zsh
#
#  @brief
#     Defines key bindings for zsh-autosuggestions.
#
#  @author
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <martin.zeman@protonmail.com>
#

if [[ -n "$key_info" ]]; then
    bindkey -M viins "$key_info[Control]F" vi-forward-word
    bindkey -M viins "$key_info[Control]E" vi-add-eol

    ## [ctrl+t] : Toggle autosuggestions
    bindkey -M emacs "$key_info[Control]T" autosuggest-toggle
fi
