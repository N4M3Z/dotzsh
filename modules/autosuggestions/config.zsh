##
#  @file
#     autosuggestions/init.zsh
#
#  @brief
#     Fish-like fast/unobtrusive autosuggestions for zsh (from tarruda/zsh-autosuggestions)
#
#  @author
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     Martin Zeman <martin.zeman@protonmail.ch>
#
#  @note
#     Must be loaded after zsh-syntax-highlighting
#

#
# Highlighting
#

# Set highlight color, default 'fg=8'.
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Disable highlighting.
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

##
# Key Bindings
#
source ${0:h}/bindings.zsh

# Legacy loading:
# if is-defined 'autosuggest-start'
# then
#     zle-line-init()
#     {
#         AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=8"
#         # AUTOSUGGESTION_HIGHLIGHT_COLOR="none"
#         AUTOSUGGESTION_HIGHLIGHT_CURSOR=0
#
#         # Known issue: setting this to true is known to cause problems when attempting to autocomplete with TAB see https://github.com/tarruda/zsh-autosuggestions
#         COMPLETION_WAITING_DOTS="false"
#         zle autosuggest-start
#     }
#
#     zle -N zle-line-init
# fi
