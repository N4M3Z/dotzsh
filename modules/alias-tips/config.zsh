##
#  @file
#       alias-tips/init.zsh
#
#  @brief
#       Integrates djui/alias-tips.
#
#  @author
#       Martin Zeman <martin.zeman@protonmail.ch>
#

# Set default text.
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: " # Variable needs to be exported first
zstyle -s ":prezto:module:alias-tips" text "ZSH_PLUGINS_ALIAS_TIPS_TEXT"
