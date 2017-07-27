##
#  @file
#       alias-tips/config.zsh
#
#  @brief
#       Integrates djui/alias-tips.
#
#  @author
#       Martin Zeman <martin.zeman@protonmail.com>
#

# Set default text.
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
zstyle -s ":dotzsh:module:alias-tips" text "ZSH_PLUGINS_ALIAS_TIPS_TEXT"
