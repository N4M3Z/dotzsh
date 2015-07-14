##
#  @file
#      history-substring-search/bindings.zsh
#
#  @brief
#      Key bindings for history-substring-search module.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Return if requirements are not found.
if (( ! $+functions[history-substring-search-up] && ! $+functions[history-substring-search-down] )); then
    return 1
fi

if [[ -n "$key_info" ]]
then
    for keymap in 'emacs' 'viins'
    do
        # start typing + [up] or [down] : Substring history search forward
        [[ -n "${key_info[Up]}"   ]] && bindkey -M "$keymap" "${key_info[Up]}"   history-substring-search-up    # start typing + [up]   replaces up-line-or-search
        [[ -n "${key_info[Down]}" ]] && bindkey -M "$keymap" "${key_info[Down]}" history-substring-search-down  # start typing + [down] replaces down-line-or-search

        if is-osx
        then
            bindkey -M "$keymap" '^[[A' history-substring-search-up
            bindkey -M "$keymap" '^[[B' history-substring-search-down
        fi
    done

    # Bindings for emacs mode.
    [[ -n "$key_info[Control]P" ]] && bindkey -M emacs "$key_info[Control]P" history-substring-search-up   # start typing + [ctrl + p] replaces up-line-or-history
    [[ -n "$key_info[Control]N" ]] && bindkey -M emacs "$key_info[Control]N" history-substring-search-down # start typing + [ctrl + n] replaces down-line-or-history

    # Bindings for vi mode.
    bindkey -M vicmd "k" history-substring-search-up   # start typing + [ctrl + k]
    bindkey -M vicmd "j" history-substring-search-down # start typing + [ctrl + j]
fi
