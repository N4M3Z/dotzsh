##
#  @file
#      profiles/lxplus.zsh
#
#  @brief
#      LXPLUS enviroment setup
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>

##
# Modules
#
zplugins=(
            # "grid"
         )

pmodload $zplugins

##
# Environment
#
export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
alias asetup='source $AtlasSetup/scripts/asetup.sh'
