#
# Initializes Dotzsh.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Martin Zeman <martin.zeman@protonmail.ch>
#

# Measure elapsed time
typeset -F SECONDS

# Define framework location
ZSH="${ZDOTDIR:-${HOME}}/.zsh"

# Debug
# set -x

##
# Version Check
#

# Check for the minimum supported version.
min_zsh_version='4.3.17'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  printf "prezto: old shell detected, minimum required: %s\n" "$min_zsh_version" >&2
  return 1
fi
unset min_zsh_version

pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

##
# File loader
# @brief Sources files.
#
function dotzsh-file-load()
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
function dotzsh-function-load()
{
    # $argv is overridden in the anonymous function.
    paths=("$argv[@]")

    local pfunction

    # Extended globbing is needed for listing autoloadable function directories.
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    # Load Prezto functions.

    for pfunction in ${^paths}/${~pfunction_glob}; do
        autoload -Uz "$pfunction"
    done
}

# Add functions to $fpath.
fpath=(${ZSH}/functions(/FN) $fpath)

# Autoload functions.
dotzsh-function-load ${ZSH}/functions/

##
# Module Loader
# @brief Loads Prezto modules.
#
function dotzsh-module-load()
{
    local -a dzmodules
    local dzmodule
    local dzmodload_start
    local dzmodload_stop
    local dzmodload_elapsed
    local dzmodload_module_start
    local dzmodload_module_stop
    local dzmodload_module_elapsed
    local dzmodload_module_elapsed_total=0
    local type

    if zstyle -t ":dotzsh:load" timing && (( $+commands[gdate] )); then
        dzmodload_start=$(gdate +'%s%N')
    else
        dzmodload_start=0
    fi

    # $argv is overridden in the anonymous function.
    dzmodules=("$argv[@]")

    # Add functions to $fpath.
    fpath=(${dzmodules:+${ZSH}/modules/${^dzmodules}/functions(/FN)} $fpath)

    # Load Prezto modules.
    for dzmodule in "$dzmodules[@]"; do
        if zstyle -t ":dotzsh:module:${dzmodule}" timing && (( $+commands[gdate] ))
        then
            dzmodload_module_start=$(gdate +'%s%N')
        fi

        if zstyle -t ":dotzsh:module:$dzmodule" loaded 'yes' 'no'
        then
            continue
        elif [[ ! -d "${ZSH}/modules/$dzmodule" ]]
        then
            print "$0: no such module: $dzmodule" >&2
            continue
        else
            # Autoload functions.
            dotzsh-function-load ${ZSH}/modules/${dzmodule}/functions/

            # Load module initialization script
            dotzsh-file-load "${ZSH}/modules/$dzmodule/init.zsh"

            if (( $? == 0 ))
            then
                zstyle ":dotzsh:module:$dzmodule" loaded 'yes'
            else
              # Remove the $fpath entry.
                dotzsh-function-unset ${dzmodule}
                zstyle ":dotzsh:module:$dzmodule" loaded 'no'
            fi

            if zstyle -t ":dotzsh:module:${dzmodule}" timing && (( $+commands[gdate] ))
            then
                let dzmodload_module_stop=$(gdate +'%s%N')
                (( dzmodload_module_elapsed = $dzmodload_module_stop - $dzmodload_module_start ))
                (( dzmodload_module_elapsed_total = $dzmodload_module_elapsed_total + $dzmodload_module_elapsed ))
            else
                dzmodload_module_elapsed=0
            fi

            zstyle ":dotzsh:module:${dzmodule}" elapsed ${dzmodload_module_elapsed}
            unset dzmodload_module_{start,stop,elapsed}
        fi
    done

    if zstyle -t ":dotzsh:load" timing && (( $+commands[gdate] ))
    then
        let dzmodload_stop=$(gdate +'%s%N')
        (( dzmodload_elapsed=$dzmodload_stop-$dzmodload_start ))
        zstyle ":dotzsh:module" elapsed ${dzmodload_module_elapsed_total}
    fi
    zstyle ":dotzsh:load" elapsed ${dzmodload_elapsed}

    unset dzmodule{s,} dzmodload_{module_,}{start,stop,elapsed}
}

function dotzsh-function-unset()
{
    local dzmodule=("$argv[@]")
    local pfunction

    # Extended globbing is needed for listing autoloadable function directories.
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    fpath[(r)${ZSH}/modules/${dzmodule}/functions]=()

    # Unload Prezto functions.
    for pfunction in ${ZSH}/modules/$dzmodule/functions/${~pfunction_glob}; do
        if [[ -s "$pfunction" ]]; then
            unfunction "$pfunction"
        fi
    done
}

function dotzsh-info
{
    local -a dzmodules
    local dzmodule
    local dzmodload_elapsed
    local dzmodload_module_loaded
    local dzmodload_module_elapsed
    local dzmodload_module_elapsed_total
    local dzmodload_module_aliases
    local dzmodload_module_bindings

    zstyle -a ':dotzsh:load' dzmodule 'dzmodules'
    zstyle -a ":dotzsh:load" elapsed 'dzmodload_elapsed'
    zstyle -a ":dotzsh:module" elapsed 'dzmodload_module_elapsed_total'
    print >&1
    print -n "  dotzsh $DOTZSH_VERSION on $OSTYPE running zsh $ZSH_VERSION"  >&1
    print >&1
    print >&1

    if zstyle -t ":dotzsh:load" timing; then
        print " module                            global  aliases bindings  startup">&1
        print " ======                            ======  ======= ========  =======">&1
    else
        print " module                            global  aliases bindings">&1
        print " ======                            ======  ======= ========">&1
    fi

    for dzmodule in "$dzmodules[@]"
    do
        zstyle -a ":dotzsh:module:$dzmodule" loaded 'dzmodload_module_loaded'
        zstyle -a ":dotzsh:module:$dzmodule" aliases 'dzmodload_module_aliases'
        zstyle -a ":dotzsh:module:$dzmodule" bindings 'dzmodload_module_bindings'
        zstyle -a ":dotzsh:module:$dzmodule" elapsed 'dzmodload_module_elapsed'

        if zstyle -t ":dotzsh:load" timing; then
            printf " %-35s %4s  %7s %8s  %10s\n" \
                ${dzmodule} \
                ${dzmodload_module_loaded} \
                ${dzmodload_module_aliases} \
                ${dzmodload_module_bindings} \
                "$(format-elapsed ${dzmodload_module_elapsed})" >&1
        else
            printf " %-35s %4s  %7s %8s\n" \
                ${dzmodule} \
                ${dzmodload_module_loaded} \
                ${dzmodload_module_aliases} \
                ${dzmodload_module_bindings} >&1
        fi
    done

    if zstyle -t ":dotzsh:load" timing; then
        print "                                                                  =======">&1
        printf "                                               modules Loaded in %8s\n" \
        "$(format-elapsed ${dzmodload_module_elapsed_total})" >&1
        printf "                                                dotzsh Loaded in %8s\n" \
        "$(format-elapsed ${dzmodload_elapsed})" >&1
    fi

    print >&1

    unset dzmodule{s,} dzmodload_module_{loaded,elapsed,aliases,bindings}
}

function format-elapsed
{
    hours=$(($1 / 10000000000000 % 24))
    mins=$(($1 / 100000000000 % 60))
    secs=$(($1 / 1000000000 % 60))
    hsecs=$(($1 / 10000000 % 100))
    msecs=$(($1 / 1000000 % 1000))

    local elapsed

    if [[ $hours > 0 ]]; then
        elapsed+="$hours hours, $mins mins and $secs secs"
    elif [[ $mins > 0 ]]; then
        elapsed+="$mins mins and $secs secs"
    elif [[ $secs > 0 ]]; then
        if [[ $hsecs > 0 ]]; then
            elapsed+="$secs.$hsecs secs"
        else
            elapsed+="$secs secs"
        fi
    elif [[ $msecs > 0 ]]; then
        elapsed+="$msecs ms"
    else
        elapsed+="0"
    fi

    print $elapsed
}

function dotzsh-load()
{
    source ~/.zshrc
}

function dotzsh-config()
{
    ${EDITOR} ~/.zsh/
}

function dotzsh-history()
{
    ${EDITOR} ${HISTFILE}
}

function dotzsh-reset()
{
    local cache=$ZSH_CACHE_DIR
    autoload -U compinit zrecompile
    compinit -d "$cache/zcomp-$HOST"

    for f in ~/.zshrc "$cache/zcomp-$HOST"; do
      zrecompile -p $f && command rm -f $f.zwc.old
    done

    zsh.setup
}

#
# Dotzsh Initialization
#

# Source the Prezto configuration file.
export ZPLUG_HOME=/usr/local/opt/ZPLUG

if [[ -s "${ZPLUG_HOME}/init.zsh" ]]; then
    source $ZPLUG_HOME/init.zsh

    if [[ -s "${ZDOTDIR:-$HOME}/.zconfig" ]]; then
      source "${ZDOTDIR:-$HOME}/.zconfig"
    fi

    # Disable color and theme in dumb terminals.
    if [[ "$TERM" == 'dumb' ]]; then
      zstyle ':dotzsh:*:*' color 'no'
      zstyle ':dotzsh:module:prompt' theme 'off'
    fi

    # Load Zsh modules.
    zstyle -a ':dotzsh:load' zmodule 'zmodules'
    for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
    unset zmodule{s,}

    # Autoload Zsh functions.
    zstyle -a ':dotzsh:load' zfunction 'zfunctions'
    for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
    unset zfunction{s,}

    # Load Prezto modules.
    zstyle -a ':dotzsh:load' dzmodule 'dzmodules'
    dotzsh-module-load "$dzmodules[@]"
    unset dzmodules

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load
    # zplug load --verbose

    # Print elapsed time
    echo "${SECONDS}s elapsed"
else
    print "Requires zplug, please install it first."
fi

alias dzinfo="dotzsh-history"
alias dzload="dotzsh-load"
alias dzconfig="dotzsh-config"
alias dzreset="dotzsh-reset"
alias dzinfo="dotzsh-info"

unset pfunction_glob
