#!/bin/zsh

##
#  @file
#     root/init.zsh
#
#  @brief
#     Integrates ROOT
#
#  @author
#     Martin Zeman <https://github.com/N4M3Z>
#
#  @note
#     Requires functioning installation of ROOT
#

ROOT_AUTOMATIC_SETUP="false"

## Setup
function root-setup()
{
    echo -e "\033[32mInitializing ROOT ...\033[0m"

    if [ -n "${BREWPATH}" ] ; then
        # Homebrew installation
        local PREFIX=$(brew --prefix homebrew/science/root)
    elif [ -n "${PORTPATH}" ] ; then
        # MacPorts installation
        local PREFIX=${PORTPATH}
    fi

    case $SHELL in
    */zsh)
        # assume ZSH
        pushd "${PREFIX}" >/dev/null
        . libexec/thisroot.sh
        popd >/dev/null
        ;;
    */bash)
        # assume BASH
        . "${PREFIX}/libexec/thisroot.sh"
        ;;
    *)
        source "${PREFIX}/libexec/thisroot.csh"
        ;;
    *)
        # assume something else
        ;;
    esac

    export ROOTGUI=native
}

## Automatic setup
if [[ -z "${ROOTSYS}" && ${ROOT_AUTOMATIC_SETUP} == "true" ]]
then
    root-setup
fi
