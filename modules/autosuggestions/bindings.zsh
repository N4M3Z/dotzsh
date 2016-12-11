##
#  @file
#     autosuggestions/bindings.zsh
#
#  @brief
#     Defines key bindings for zsh-autosuggestions.
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.com>
#

if [[ -n "$key_info" ]]; then
    # vi
    bindkey -M viins "$key_info[Control]F" vi-forward-word
    bindkey -M viins "$key_info[Control]E" vi-add-eol

    # [ctrl+t] : Toggle autosuggestions
    bindkey '\C-t' autosuggest-toggle
fi
