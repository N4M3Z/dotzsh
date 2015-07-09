#
# Integrates history-substring-search into Prezto.
#
# Authors:
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# # Load dependencies.
# pmodload 'editor'

##
# zsh-users/zsh-history-substring-search
#
if is-defined 'history-substring-search-up'; then
    # Create a zkbd compatible hash using terminfo:
    zmodload zsh/terminfo
    typeset -A key

    key[Up]=${terminfo[kcuu1]}
    key[Down]=${terminfo[kcud1]}

    # start typing + [up] or [down] : Substring history search forward
    [[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   history-substring-search-up    # start typing + [up]   replaces up-line-or-search
    [[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-substring-search-down  # start typing + [down] replaces down-line-or-search

    if is-osx; then
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
    fi

    # bindings for emacs mode
    bindkey -M emacs '\C-p' history-substring-search-up   # start typing + [ctrl + p] replaces up-line-or-history
    bindkey -M emacs '\C-n' history-substring-search-down # start typing + [ctrl + n] replaces down-line-or-history

    # bindings for vi mode
    bindkey -M vicmd 'k' history-substring-search-up   # start typing + [ctrl + k]
    bindkey -M vicmd 'j' history-substring-search-down # start typing + [ctrl + j]
fi
