##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Defines Homebrew aliases.
#
#  @author
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <https://github.com/N4M3Z>
#

##
# Aliases
#

## Homebrew
alias bubu="brew update && brew upgrade"

alias brews='brew list -1'
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew update && brew upgrade --all'
alias brewx='brew remove'

## Homebrew Cask
alias cask='brew cask'
alias casks="brew cask list"
alias caskc='brew cask cleanup --outdated'
alias caskC='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew cask uninstall'
