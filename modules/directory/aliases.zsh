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

## Directory operations
#alias ..="cd .."     # handled by auto_cd
#alias ...="cd ../.." # handled by auto_cd
alias -- -="cd -"

# alias 1="cd -"
# alias 2="cd -2"
# alias 3="cd -3"
# alias 4="cd -4"
# alias 5="cd -5"
# alias 6="cd -6"
# alias 7="cd -7"
# alias 8="cd -8"
# alias 9="cd -9"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

## Push and pop directories on directory stack
alias d="dirs -v | head -10" # prints the contents of the directory stack.
alias pu="pushd"
alias po="popd"
