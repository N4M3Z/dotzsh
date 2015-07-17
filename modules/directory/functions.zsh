##
#  @file
#      directory/functions.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Creates a directory and then changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}
