#
# Defines general aliases and functions.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper' 'spectrum'

# Correct commands.
setopt CORRECT

##
# Aliases
#
source ${0:h}/functions.zsh

##
# Aliases
#
source ${0:h}/aliases.zsh

##
# Key Bindings
#
source ${0:h}/bindings.zsh
