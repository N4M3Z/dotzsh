#!/bin/zsh

##
#  @file
#  @brief Z-Shell Directory Settings
#  @author N4M3Z <https://github.com/N4M3Z>
#  @note Original version from oh-my-zsh repository

##
# Options
#
extended_wordchars='*?_-.[]~=&;!#$%^(){}<>:@,\\';
extended_wordchars_space="${my_extended_wordchars} "
extended_wordchars_slash="${my_extended_wordchars}/"

# is the current position \-quoted ?
function is_quoted()
{
    test "${BUFFER[$CURSOR-1,CURSOR-1]}" = "\\"
}

unquote-forward-word()
{
    while is_quoted
        do zle .forward-word
    done
}

unquote-backward-word()
{
    while  is_quoted
        do zle .backward-word
    done
}

backward-to-space()
{
    local WORDCHARS=${extended_wordchars_slash}
    zle .backward-word
    unquote-backward-word
}

forward-to-space()
{
     local WORDCHARS=${extended_wordchars_slash}
     zle .forward-word
     unquote-forward-word
}

backward-to-slash()
{
    local WORDCHARS=${extended_wordchars}
    zle .backward-word
    unquote-backward-word
}

forward-to-slash()
{
     local WORDCHARS=${extended_wordchars}
     zle .forward-word
     unquote-forward-word
}

zle -N backward-to-space
zle -N forward-to-space
zle -N backward-to-slash
zle -N forward-to-slash

bindkey '\e[1;9A' backward-to-space # [alt + up]
bindkey '\e[1;9B' forward-to-space  # [alt + down]

bindkey '\C-f' forward-to-slash  # [ctrl + f] replaces forward-word
bindkey '\C-b' backward-to-slash # [ctrl + b] replaces backward-word

bindkey '\e[1;9C' forward-to-slash  # [alt + left]  replaces forward-word
bindkey '\e[1;9D' backward-to-slash # [alt + right] replaces forward-word
