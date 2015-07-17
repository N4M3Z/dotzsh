##
#  @file
#      directory/aliases.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      James Cox <james@imaj.es>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <https://github.com/N4M3Z>
#

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
