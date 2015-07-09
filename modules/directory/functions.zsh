##
#  @file
#      directory/functions.zsh
#
#  @brief
#      Sets directory options and defines directory aliases.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Creates a directory and then changes to it.
function take()
{
    mkdir -p $1
    cd $1
}
