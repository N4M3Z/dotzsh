##
#  @file
#      directory-history/init.zsh
#
#  @brief
#      Integrates directory-history.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Check if files are executable
function executable()
{
    file=$1
    if ! [[ -x "$file" ]]
    then
        chmod +x "$file"
    fi
}

# Aliases have to exist before the module is sourced
alias dirhist="${0:h}/external/dirhist"
alias dirlog="${0:h}/external/dirlog"

executable dirhist
executable dirlog

# Source module files.
zplug "tymm/zsh-directory-history", \
    as:plugin, \
    on:"zsh-users/zsh-history-substring-search", \
    defer:3, \
    hook-load:"source ${0:h}/bindings.zsh"
