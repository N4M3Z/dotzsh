##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Fish-like fast/unobtrusive autosuggestions for zsh (from tarruda/zsh-autosuggestions)
#
#  @author
#     Martin Zeman <martin.zeman@protonmail.ch>
#
#  @note
#     Must be loaded after zsh-syntax-highlighting
#

## Source module files.
source "${0:h}/external/autosuggestions.zsh" || return 1

if is-defined 'autosuggest-start'
then
    zle-line-init()
    {
        AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=8"
        # AUTOSUGGESTION_HIGHLIGHT_COLOR="none"
        AUTOSUGGESTION_HIGHLIGHT_CURSOR=0

        # Known issue: setting this to true is known to cause problems when attempting to autocomplete with TAB see https://github.com/tarruda/zsh-autosuggestions
        COMPLETION_WAITING_DOTS="false"
        zle autosuggest-start
    }

    zle -N zle-line-init
fi
