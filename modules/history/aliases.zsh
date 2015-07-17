##
# @file
#      history/aliases.zsh
#
# @brief
#      Sets history options and defines history aliases.
#
# @authors
#      Robby Russell <robby@planetargon.com>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman  <martin.zeman@protonmail.ch>
#

##
# Aliases
#

# Modify history alias to list full history
alias history='fc -l 1' # default: fc -l

zstyle -s ':dotzsh:module:history' format 'FORMAT'
case $FORMAT in
    "mm/dd/yyyy") alias history='fc -fl 1' ;;
    "dd.mm.yyyy") alias history='fc -El 1' ;;
    "yyyy-mm-dd") alias history='fc -il 1' ;;
    *) alias history='fc -l 1' ;;
esac

alias hgrep="history | grep"
alias hgrepi="hgrep -i"
alias hedit="zsh-history-edit"
alias hstat="zsh-history-stats"
