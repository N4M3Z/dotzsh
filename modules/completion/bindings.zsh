##
#  @file
#    completion/bindings.zsh
#
#  @brief
#      Key bindings for the completion module
#
#  @author
#      Robby Russell <robby@planetargon.com>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <martin.zeman@protonmail.ch>
#

## Completion dots
if zstyle -t ':dotzsh:module:completion' waiting-dots
then
    expand-or-complete-with-dots()
    {
        echo -n "\e[31m......\e[0m"
        zle expand-or-complete
        zle redisplay
    }
    zle -N expand-or-complete-with-dots
    bindkey "^I" expand-or-complete-with-dots
fi

## Menu select
if zstyle -t ':dotzsh:module:completion' complist
then
    # [Shift-Tab] - move through the completion menu backwards
    if [[ "${terminfo[kcbt]}" != "" ]]; then
        bindkey "${terminfo[kcbt]}" reverse-menu-complete
    else
        bindkey '^[[Z' reverse-menu-complete
    fi

    # [esc + enter] Multiselect from menus
    bindkey -M menuselect '\e\r' .accept-and-menu-complete

    # Used to make the return key leave menu selection and accepting the match currently selected
    # Widgets starting with a dot always refer to the zsh built-in widgets, the same way `command` works for the shell
    bindkey -M menuselect '\r' .accept-line

    # [Tab] select and find new matches
    bindkey -M menuselect "\t" .accept-and-infer-next-history
fi
