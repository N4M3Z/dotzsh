#!/bin/zsh

##
#  @file
#  @brief TeX Plugin
#  @author N4M3Z <https://github.com/N4M3Z>

# Add TeX to path if not already included
if [[ :$PATH: != *:"/usr/texbin":* ]]
then
    export PATH="$PATH:/usr/texbin"
fi

function tex.export()
{
    # TEXDIR (the main TeX directory):
    export TEXDIR=$(kpsewhich -var-value TEXDIR)
    # TEXMFLOCAL (directory for site-wide local files):
    export TEXMFLOCAL=$(kpsewhich -var-value TEXMFLOCAL)
    # TEXMFSYSVAR (directory for variable and automatically generated data):
    export TEXMFSYSVAR=$(kpsewhich -var-value TEXMFSYSVAR)
    # TEXMFSYSCONFIG (directory for local config):
    export TEXMFSYSCONFIG=$(kpsewhich -var-value TEXMFSYSCONFIG)
    # TEXMFVAR (personal directory for variable and automatically generated data):
    export TEXMFVAR=$(kpsewhich -var-value TEXMFVAR)
    # TEXMFCONFIG (personal directory for local config):
    export TEXMFCONFIG=$(kpsewhich -var-value TEXMFCONFIG)
    # TEXMFHOME (directory for user-specific files):
    export TEXMFHOME=$(kpsewhich -var-value TEXMFHOME)
}

alias latexmkp="latexmk -pdf"
alias latexmko="latexmk -outdir=Output"
alias latexmkpo="latexmk -pdf -outdir=Output"

alias -g TEX="| grep --color -E 'Error|Warning|Missing|nag|$'"
