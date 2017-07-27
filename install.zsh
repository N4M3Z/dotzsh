#!/bin/zsh

#
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Martin Zeman <martin.zeman@protonmail.ch>
#

function link-file()
{
    for file in "$@"
    do
        local dotfile="${ZDOTDIR:-$HOME}/.${file:t}"
        echo "$dotfile"

        if [[ -h "$dotfile" ]] || [[ -s "$dotfile" ]]
        then
            read "answer?$dotfile already exists, do you wish to overwrite (Y/N)?"
            case $answer in
                [Yy]* ) command rm "$dotfile"; ;;
                [Nn]* ) ;;
                * ) echo "Please answer yes or no.";;
            esac
        fi

        ln -s "${file}" "${dotfile}"
    done
}

# Check for the minimum supported version.
min_zsh_version='4.3.17'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
    print "Old shell detected, minimum required: $min_zsh_version" >&2
    return 1
fi
unset min_zsh_version

echo "Installing zsh-core ..."

CURRENT_DIR="$(cd "$(dirname "${0}")" && pwd -P)"

# Create necessary symbolic links for prezto
rm "${ZDOTDIR:-$HOME}/.zsh"
ln -s "$CURRENT_DIR" "${ZDOTDIR:-$HOME}/.zsh"

setopt EXTENDED_GLOB
# Link everything except README.md
link-file "$CURRENT_DIR"/templates/^README.md(.N)
link-file "$CURRENT_DIR"/private/^README.md(.N)

# Decrypt files (if StackExchange/blackbox is available)
if type "blackbox_postdeploy" &> /dev/null;
then
    blackbox_postdeploy
fi
