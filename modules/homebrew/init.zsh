#
# Defines Homebrew aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != (darwin|linux)* ]]; then
  return 1
fi

# Opt out of Homebrew's analytics
export HOMEBREW_NO_ANALYTICS=1

# additional security options
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS="--require-sha"

# Since El Capitan, openssl is not linked by homebrew
OPENSSL_LATEST_PATH=$(find /usr/local/Cellar/openssl -name "bin" -maxdepth 2 -type d | sort -nr | head -n 1)

if [ -n "$OPENSSL_LATEST_PATH" ]
then
    export PATH="${OPENSSL_LATEST_PATH}:${PATH}"
fi

##
# Aliases
#
source ${0:h}/aliases.zsh
