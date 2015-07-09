#!/bin/zsh

# Path to zsh configuration
export ZSH="${HOME}/.zsh"
export ZGEN="${ZSH}/modules/zgen/external/zgen.zsh"
export ZGEN_DIR="${ZSH}/modules/zgen/external/"

# Source Zgen framework.
source "${ZGEN}"

if ! zgen saved; then
    echo -e "\033[32mInitializing zgen ...\033[0m"

    # Load Zgen runcom.
    if [[ -s "${ZDOTDIR:-$HOME}/.zgen" ]]
    then
        source "${ZDOTDIR:-$HOME}/.zgen"
    fi

    # Save all to init script
    zgen save
fi
