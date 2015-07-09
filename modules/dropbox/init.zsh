#!/bin/zsh

##
#  @file
#  @brief Z-Shell Dropbox CLI
#  @author N4M3Z <https://github.com/N4M3Z>

# For Linux we may use the CLI version of Dropbox, otherwise andreafabrizi/Dropbox-Uploader must be used

if is-linux; then
    # Use Dropbox CLI
    # Add plugin bin diretory to user's path
    PLUGIN_BIN="$(dirname $0)"
    export PATH="${PATH}:${PLUGIN_BIN}"
else
    # andreafabrizi/Dropbox-Uploader
    alias dropbox="${0:h}/external/dropbox_uploader.sh"
    alias dropshell="${0:h}/external/dropShell.sh"
fi
