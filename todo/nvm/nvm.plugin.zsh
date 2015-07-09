#!/bin/zsh

##
#  @file
#  @brief Node Version Manager
#
#  @author N4M3Z <https://github.com/N4M3Z>
#
#  @note From https://github.com/creationix/nvm

export NVM_DIR=~/.nvm
source "$(brew --prefix nvm)/nvm.sh"

function nvm.install()
{
    if [[ -n "${BREWPATH}" ]] ; then
        # Homebrew install
        brew install nvm
    else
        # Manual install
        git clone https://github.com/creationix/nvm.git ~/.nvm
        cd ~/.nvm
        git checkout `git describe --abbrev=0 --tags`
    fi
}

function nvm.install.packages()
{
    nvm install jshint
}

function nvm_prompt_info()
{
    [ -f "$HOME/.nvm/nvm.sh" ] || return
    local nvm_prompt
    nvm_prompt=$(node -v 2>/dev/null)
    [[ "${nvm_prompt}x" == "x" ]] && return
    nvm_prompt=${nvm_prompt:1}
    echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${nvm_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
}
