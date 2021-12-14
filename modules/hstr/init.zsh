#
# Sets options for hstr module
#
# Authors:
#   Martin Zeman <martin@zeman.email>
#

# HSTR configuration
alias hh=hstr                 # hh to be alias for hstr
export HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"   # ensure history file visibility
export HSTR_CONFIG=hicolor    # get more colors
bindkey -s "\C-r" "\eqhstr\n" # bind hstr to Ctrl-r (for Vi mode check doc)
