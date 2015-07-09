##
#  @file
#      directory/bindings.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# [esc + esc] ? run command: cd ..
function parent-dir()
{
    cd ..
    zle accept-line
}
zle -N parent-dir
bindkey '\e ' parent-dir # [esc + space]

# [esc + enter] : print Git/Svn status or list files with ls
function ls-status()
{
    print
    zle accept-line
    if [ -d .git ]; then
        git status --short
    elif [ -d .svn ]; then
        svn status
    else
        ll
    fi
    zle accept-line
}
zle -N ls-status
bindkey '\e\r' ls-status # [esc + enter]
bindkey '\M\r' ls-status # [alt + enter]
