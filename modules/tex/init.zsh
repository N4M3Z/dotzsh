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

if [[ :$PATH: != *:"/Library/TeX/texbin":* ]]
then
    export PATH="$PATH:/Library/TeX/texbin"
fi

alias latexmkp="latexmk -pdf"
alias latexmko="latexmk -outdir=Output"
alias latexmkpo="latexmk -pdf -outdir=Output"

alias -g TEX="| grep --color -E 'Error|Warning|Missing|nag|$'"
