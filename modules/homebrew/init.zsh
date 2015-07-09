##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Intialize Homebrew.
#
#  @author
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <https://github.com/N4M3Z>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != (darwin|linux)* ]]; then
  return 1
fi

HOMEBREW_AUTOMATIC_SETUP="true"

## Setup
function brew-setup()
{
    echo -e "\033[32mInitializing Homebrew ...\033[0m"

    export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
    export BREWPATH=$(brew --prefix)

    # if pyenv exists:
    if type "pyenv" > /dev/null; then
        eval "$(pyenv init -)"
        export PYENV_ROOT=/usr/local/opt/pyenv
    fi
}

function cask-setup()
{
    echo -e "\033[32mInitializing Caskroom ...\033[0m"

    # User enviroment variables
    export CASKROOM="/usr/local/Library/Taps/caskroom"

    # Homebrew cask settings
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
}

## Automatic setup
if [[ -z "${BREWPATH}" && ${HOMEBREW_AUTOMATIC_SETUP} == "true" ]]
then
    brew-setup
    cask-setup
fi

## Common tasks: Prepend Homebrew paths system-wide
function brew-patch()
{
    sudo cp /etc/paths /etc/paths.backup
    sudo touch /etc/paths

    #/usr/local/bin
    #/usr/local/sbin
    #/usr/bin
    #/bin
    #/usr/sbin
    #/sbin
}
