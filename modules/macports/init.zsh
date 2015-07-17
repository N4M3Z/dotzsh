#
# Defines MacPorts aliases and adds MacPorts directories to path variables.
#
# Authors:
#   Matt Cable <wozz@wookie.net>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Paths
#

# Set the list of directories that Zsh searches for programs.
path=(
  /opt/local/{bin,sbin}
  $path
)

##
# Aliases
#
source ${0:h}/aliases.zsh
