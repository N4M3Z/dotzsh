##
#  @file
#      wordchar/functions.zsh
#
#  @brief
#      Z-Shell character skipping using extended wordchars
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# is the current position \-quoted ?
function is_quoted()
{
    test "${BUFFER[$CURSOR-1,CURSOR-1]}" = "\\"
}

function unquote-forward-word()
{
    while is_quoted
        do zle .forward-word
    done
}

function unquote-backward-word()
{
    while  is_quoted
        do zle .backward-word
    done
}

function backward-to-space()
{
    local WORDCHARS=${extended_wordchars_slash}
    zle .backward-word
    unquote-backward-word
}

function forward-to-space()
{
     local WORDCHARS=${extended_wordchars_slash}
     zle .forward-word
     unquote-forward-word
}

function backward-to-slash()
{
    local WORDCHARS=${extended_wordchars}
    zle .backward-word
    unquote-backward-word
}

function forward-to-slash()
{
     local WORDCHARS=${extended_wordchars}
     zle .forward-word
     unquote-forward-word
}

zle -N backward-to-space
zle -N forward-to-space
zle -N backward-to-slash
zle -N forward-to-slash
