#!/bin/zsh

##
#  @file
#      trash/init.zsh
#
#  @brief
#      *trash* plugin - a safer alternative to rm
#      (https://github.com/sindresorhus/trash)
#
#  @authors
#      Martin Zeman <martin.zeman@protonmai.ch>
#
# Trash is a cross-platform command-line app for moving files and directories to the trash. A safer alternative to rm.
# https://github.com/sindresorhus/trash
# - On OS X osx-trash is used.
# - On Linux xdg-trash is used.
# - On Windows cmdutils is used.

# empty-trash:
# https://github.com/sindresorhus/empty-trash
# - On OS X AppleScript is used as it's the only way to do it without incurring permission issues.
# - On Linux xdg-empty-trash is used.
# - On Windows NirCmd is used.

# Add TeX to path if not already included
function install-trash()
{
    if (( ! $+commands[npm] ))
    then
        npm install --global trash
        npm install --global empty-trash
    else
        echo "Installation of (trash) requires (npm). Please install it first."
    fi
}

if (( ! $+commands[trash] ))
then
    vared -p 'Trash is not installed, would you like to install it? (yes/no) ' -c install
    if [[ $install == "yes" ]]
    then
        install-trash
    fi
fi
