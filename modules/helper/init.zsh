#
# Defines helper functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Martin Zeman <martin.zeman@protonmail.ch>
#

# Update core and all submodules
function zsh-update()
{
    cd "${ZDOTDIR:-$HOME}/.zconfig"
    git pull
    git submodule update --init --recursive
}

# Merge upstream updates
function zsh-merge()
{
    git merge upstream/master
    git submodule update --init --recursive
}

# Checks if a file can be autoloaded by trying to load it in a subshell.
function is-autoloadable {
  ( unfunction $1 ; autoload -U +X $1 ) &> /dev/null
}

# Checks if a name is a command, function, or alias.
function is-callable {
  (( $+commands[$1] || $+functions[$1] || $+aliases[$1] || $+builtins[$1] ))
}

# Checks a boolean variable for "true".
# Case insensitive: "1", "y", "yes", "t", "true", "o", and "on".
function is-true {
  [[ -n "$1" && "$1" == (1|[Yy]([Ee][Ss]|)|[Tt]([Rr][Uu][Ee]|)|[Oo]([Nn]|)) ]]
}

# Prints the first non-empty string in the arguments array.
function coalesce {
  for arg in $argv; do
    print "$arg"
    return 0
  done
  return 1
}

# Check whether a command is defined
function is-defined ()
{
    type "$1" &> /dev/null;
}

# Check whether the enviroment is Cygwin
function is-cygwin ()
{
    [[ $('uname') == 'Cygwin' ]]
}

# Check whether the enviroment is Linux
function is-linux ()
{
    [[ $('uname') == 'Linux' ]]
}

# Check whether the enviroment is OS X
function is-osx ()
{
    [[ $('uname') == 'Darwin' ]]
}
