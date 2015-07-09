##
#  @file
#      directory/init.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      James Cox <james@imaj.es>
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <martin.zeman@protonmail.ch>
#

##
# Options
#
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.
# setopt PUSHDMINUS           # Swaps the meaning of cd +1 and cd -1
setopt RM_STAR_WAIT         # forces 10 second wait until executing rm with a star rm folder/*.

unsetopt RM_STAR_SILENT # asks before executing rm with a star rm folder/*.
