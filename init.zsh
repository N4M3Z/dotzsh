##
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Martin Zeman <martin.zeman@protonmail.ch>
#

# Measure elapsed time
typeset -F SECONDS

# Debug
# set -x

##
# Version Check
#

# Check for the minimum supported version.
min_zsh_version='4.3.17'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  print "prezto: old shell detected, minimum required: $min_zsh_version" >&2
  return 1
fi
unset min_zsh_version

##
# File loader
# @brief Sources files.
#
function pfileload()
{
  file=$1
  if [[ -s $file ]]
  then
    source $file
  fi
}

##
# Function loader
# @brief Loads Prezto functions.
#
function pfuncload()
{
  local pfunction
  local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

  # Extended globbing is needed for listing autoloadable function directories.
  setopt LOCAL_OPTIONS EXTENDED_GLOB
  # Load Prezto functions.
  for pfunction in $1/$~pfunction_glob; do
    autoload -Uz "$pfunction"
  done
}

# Add functions to $fpath.
fpath=(${pmodules:+${ZDOTDIR:-$HOME}/.zprezto/functions(/FN)} $fpath)

# Autoload functions.
pfuncload ${ZDOTDIR:-$HOME}/.zprezto/functions/

##
# Module Loader
# @brief Loads Prezto modules.
#
function pmodload()
{
  local -a pmodules
  local pmodule

  # $argv is overridden in the anonymous function.
  pmodules=("$argv[@]")

  # Add functions to $fpath.
  fpath=(${pmodules:+${ZDOTDIR:-$HOME}/.zprezto/modules/${^pmodules}/functions(/FN)} $fpath)

  # Autoload functions.
  pfuncload ${ZDOTDIR:-$HOME}/.zprezto/modules/${^pmodules}/functions/

  # Load Prezto modules.
  for pmodule in "$pmodules[@]"; do
    if zstyle -t ":prezto:module:$pmodule" loaded 'yes' 'no'; then
      continue
    elif [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule" ]]; then
      print "$0: no such module: $pmodule" >&2
      continue
    else
      # Load module initialization script
      pfileload "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh"

      # Load module functions
      pfileload "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/functions.zsh"

      # Load module aliases
      pfileload "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/aliases.zsh"

      # Load module key bindings
      pfileload "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/bindings.zsh"

      if (( $? == 0 )); then
        zstyle ":prezto:module:$pmodule" loaded 'yes'
      else
        # Remove the $fpath entry.
        fpath[(r)${ZDOTDIR:-$HOME}/.zprezto/modules/${pmodule}/functions]=()

        function {
          local pfunction

          # Extended globbing is needed for listing autoloadable function
          # directories.
          setopt LOCAL_OPTIONS EXTENDED_GLOB

          # Unload Prezto functions.
          for pfunction in ${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/functions/$~pfunction_glob; do
            unfunction "$pfunction"
          done
        }

        zstyle ":prezto:module:$pmodule" loaded 'no'
      fi
    fi

    # Print elapsed time
    # echo "$pmodule: ${SECONDS}s elapsed"

  done
}

#
# Prezto Initialization
#

# Source the Prezto configuration file.
if [[ -s "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zpreztorc"
fi

# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi

# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

# Autoload Zsh functions.
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

# Load Prezto modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
pmodload "$pmodules[@]"
unset pmodules

# Print elapsed time
echo "${SECONDS}s elapsed"
