##
#  @file
#      blackbox/config.zsh
#
#  @brief
#      Configures StackExchange/blackbox.
#
#  @author
#      Martin Zeman <https://github.com/N4M3Z>
#

export GPGKEY="$(gpg -K | awk 'NR==3 {print $2}' | sed 's/4096R\///g')"
